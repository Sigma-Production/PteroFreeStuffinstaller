var freeDisk = Pterodactyl.totalNodeDisk - Pterodactyl.totalServerDisk;
let diskChart = new Chart($('#disk_chart'), {
    type: 'pie',
    data: {
        labels: ['Free Disk', 'Used Disk'],
        datasets: [
            {
                label: 'Disk (in MB)',
                backgroundColor: ['#51B060', '#ff0000'],
                data: [freeDisk, Pterodactyl.totalServerDisk]
            }
        ]
    }
});

var freeRam = Pterodactyl.totalNodeRam - Pterodactyl.totalServerRam;
let ramChart = new Chart($('#ram_chart'), {
    type: 'pie',
    data: {
        labels: ['Free RAM', 'Used RAM'],
        datasets: [
            {
                label: 'Memory (in MB)',
                backgroundColor: ['#51B060', '#ff0000'],
                data: [freeRam, Pterodactyl.totalServerRam]
            }
        ]
    }
});

var activeServers = Pterodactyl.servers.length - Pterodactyl.suspendedServers;
let serversChart = new Chart($('#servers_chart'), {
    type: 'pie',
    data: {
        labels: ['Active', 'Suspended'],
        datasets: [
            {
                label: 'Servers',
                backgroundColor: ['#51B060', '#E08E0B'],
                data: [activeServers, Pterodactyl.suspendedServers]
            }
        ]
    }
});

let statusChart = new Chart($('#status_chart'), {
    type: 'pie',
    data: {
        labels: ['Online', 'Offline', 'Error'],
        datasets: [
            {
                label: '',
                backgroundColor: ['#51B060', '#b7b7b7', '#ff0000'],
                data: [0,0,0]
            }
        ]
    }
});

var servers = Pterodactyl.servers;

for (let i = 0; i < servers.length; i++) {
	getStatus(servers[i])
}

function getStatus(server) {
	var statusOfServer = Pterodactyl.serverstatus[server.uuid].attributes.current_state;
	
	if(statusOfServer == "running") statusChart.data.datasets[0].data[0]++
	else if(statusOfServer == "offline") statusChart.data.datasets[0].data[1]++
	else statusChart.data.datasets[0].data[2]++

	statusChart.update();
}
