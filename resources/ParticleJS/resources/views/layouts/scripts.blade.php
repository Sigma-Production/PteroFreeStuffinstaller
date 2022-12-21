<script src="https://cdn.jsdelivr.net/npm/tsparticles-engine"></script>
<script src="https://cdn.jsdelivr.net/npm/tsparticles/tsparticles.bundle.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Get settings from the server
        var settings = fetch('/particlejs').then(function(response) {
            return response.json();
        });
        // Set the default settings
        settings.then(function(settings) {
            if (settings.data.enabled == 'true') {
                console.log(settings.data)
                if(settings.data.custom_enabled == 'true'){
                    // Transform the string into a json object
                    tsParticles.load(document.body, JSON.parse(settings.data.custom));
                    return;
                }
                var json = fetch('/assets/json/' + settings.data.preset + '.json').then(function(
                    response) {
                    return response.json();
                });

                json.then(function(json) {
                    json.background.color = settings.data.color;
                    if (settings.data.interactive == 'true')
                        json.interactivity.events.onHover.enable = true;
                    else
                        json.interactivity.events.onHover.enable = false;
                    tsParticles.load(document.body, json);
                });
            }
        });
    });
</script>
