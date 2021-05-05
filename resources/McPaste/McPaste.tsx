import React, { useEffect, useState } from 'react';
import tw from "twin.macro";
import Button from "@/components/elements/Button";
import { ServerContext } from "@/state/server";
import { SocketEvent } from "@/components/server/events";
import Fade from "@/components/elements/Fade";
import { SwitchTransition } from "react-transition-group";
import styled, { keyframes } from "styled-components/macro";

interface PasteResponse {
    key: string
}

const fade = keyframes`
    from { opacity: 0 }
    to { opacity: 1 }
`;

const Toast = styled.div`
    ${tw`fixed z-50 bottom-0 left-0 mb-4 w-full flex justify-end pr-4`};
    animation: ${fade} 250ms linear;

    & > div {
        ${tw`rounded px-4 py-2 text-white bg-neutral-900 border border-black opacity-75`};
    }
`;

export default () => {
    const [ log, setLog ] = useState<string[]>([]);
    const addLog = (data: string) => setLog(prevLog => [...prevLog, data.startsWith(">") ? data.substring(1) : data])

    const [uploading, setUploading] = useState(false)
    const [copied, setCopied] = useState<boolean | 'Error'>(false)
    const { connected, instance } = ServerContext.useStoreState(state => state.socket);

    useEffect(() => {
        if (!connected || !instance) return

        instance.addListener(SocketEvent.CONSOLE_OUTPUT, addLog);

        return () => {
            instance.removeListener(SocketEvent.CONSOLE_OUTPUT, addLog);
        }
    }, [ connected, instance ])

    const resetStateAfter = (ms = 2500) => {
        setTimeout(() => {
            setCopied(false)
            setUploading(false);
        }, ms);
    }

    const mcPaste = () => {
        const formData = new FormData()
        formData.append("data", log.map(it => it.replace("\r", "")).join("\n"))
        setUploading(true);
        fetch(`https://api.mcpaste.com`, {
            method: "POST",
            body: formData
        }).then(data => data.json())
            .then((data: PasteResponse) => {
                if(navigator.clipboard !== undefined)
                    return navigator.clipboard.writeText(`https://mcpaste.com/${data.key}`);

                const area = document.createElement("textarea");
                area.value = `https://mcpaste.com/${data.key}`;
                area.style.position = "fixed";
                document.body.appendChild(area);
                area.focus();
                area.select();
                area.setSelectionRange(0, 99999);

                document.execCommand("copy");

                document.body.removeChild(area);
                return Promise.resolve();
            })
            .then(() => {
                setCopied(true);
                resetStateAfter();
            })
            .catch(() => {
                setCopied("Error")
                resetStateAfter()
            })
    }

    return (
        <div css={tw`shadow-md bg-neutral-700 rounded p-3 flex text-xs mt-4 justify-center`}>
            <Button
                size={'xsmall'}
                color={'grey'}
                isSecondary
                css={tw`mr-2`}
                disabled={uploading}
                onClick={e => {
                    mcPaste()
                }}
            >
                Send to McPaste.com
            </Button>
            <SwitchTransition>
                <Fade timeout={250} key={copied !== false ? 'visible' : 'invisible'}>
                    {copied !== false ?
                        <Toast>
                            <div>
                                <p css={tw`text-lg`}>{copied === "Error" ? "Couldn't send log" : "Copied link to clipboard."}</p>
                            </div>
                        </Toast>
                        : <></>
                    }
                </Fade>
            </SwitchTransition>
        </div>
    )
}
