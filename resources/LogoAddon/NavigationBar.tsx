import * as React from 'react';
import { Link, NavLink } from 'react-router-dom';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faCogs, faLayerGroup, faSignOutAlt, faUserCircle } from '@fortawesome/free-solid-svg-icons';
import { useStoreState } from 'easy-peasy';
import { ApplicationStore } from '@/state';
import SearchContainer from '@/components/dashboard/search/SearchContainer';
import tw, { theme } from 'twin.macro';
import styled from 'styled-components/macro';
import http from '@/api/http';
import SpinnerOverlay from '@/components/elements/SpinnerOverlay';
import { useState } from 'react';

const Navigation = styled.div`
    ${tw`w-full bg-neutral-900 shadow-md overflow-x-auto`};
    
    & > div {
        ${tw`mx-auto w-full flex items-center`};
    }
    
    & #logo {
        ${tw`flex-1`};
        
        & > a {
            ${tw`text-2xl font-header px-4 no-underline text-neutral-200 hover:text-neutral-100 transition-colors duration-150`};
        }
    }
`;

const RightNavigation = styled.div`
    ${tw`flex h-full items-center justify-center`};
    
    & > a, & > button, & > .navigation-link {
        ${tw`flex items-center h-full no-underline text-neutral-300 px-6 cursor-pointer transition-all duration-150`};
        
        &:active, &:hover {
            ${tw`text-neutral-100 bg-black`};
        }
        
        &:active, &:hover, &.active {
            box-shadow: inset 0 -2px ${theme`colors.cyan.700`.toString()};
        }
    }
`;

export default () => {
    const name = useStoreState((state: ApplicationStore) => state.settings.data!.name);
    const frontendLogo = useStoreState((state: ApplicationStore) => state.settings.data!.logo_frontend);
    const frontendLogoMode = useStoreState((state: ApplicationStore) => state.settings.data!.logo_frontend_mode);
    const logoMode = useStoreState((state: ApplicationStore) => state.settings.data!.logo_mode);
    const rootAdmin = useStoreState((state: ApplicationStore) => state.user.data!.rootAdmin);
    const [ isLoggingOut, setIsLoggingOut ] = useState(false);

    let showLogo;
    let showText;

    console.log('logoMode: ' + logoMode);
    console.log('frontendLogo: ' + frontendLogo);

    if (logoMode == '0'){
        showLogo = false;
    } else if (logoMode == '1') {
        showLogo = true;
    } else if (logoMode == '2') {
        showLogo = false;
    } else if (logoMode == '3') {
        showLogo = true;
    } else {
        console.log('Failed to get the logoMode');
    }

    if (frontendLogoMode == '0'){
        showText = false;
    } else if (frontendLogoMode == '1') {
        showText = true;
    } else if (frontendLogoMode == '2') {
        showText = false;
    } else {
        console.log('Failed to get the logoMode');
    }

    const onTriggerLogout = () => {
        setIsLoggingOut(true);
        http.post('/auth/logout').finally(() => {
            // @ts-ignore
            window.location = '/';
        });
    };

    return (
        <Navigation>
            <SpinnerOverlay visible={isLoggingOut} />
            <div css={tw`mx-auto w-full flex items-center`} style={{ maxWidth: '1200px', height: '3.5rem' }}>
                <div id={'logo'}>
                    <Link to={'/'}>
                        {showLogo = true && 
                            <img src={frontendLogo} style="height:32px;"></img>
                        }
                        {showText = true &&
                            <span>{name}</span>
                        }
                    </Link>
                </div>
                <RightNavigation>
                    <SearchContainer/>
                    <NavLink to={'/'} exact>
                        <FontAwesomeIcon icon={faLayerGroup}/>
                    </NavLink>
                    <NavLink to={'/account'}>
                        <FontAwesomeIcon icon={faUserCircle}/>
                    </NavLink>
                    {rootAdmin &&
                    <a href={'/admin'} rel={'noreferrer'}>
                        <FontAwesomeIcon icon={faCogs}/>
                    </a>
                    }
                    <button onClick={onTriggerLogout}>
                        <FontAwesomeIcon icon={faSignOutAlt}/>
                    </button>
                </RightNavigation>
            </div>
        </Navigation>
    );
};
