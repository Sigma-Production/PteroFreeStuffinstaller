<?php

namespace Pterodactyl\Http\Controllers\Admin;

use Carbon\Carbon;
use Illuminate\Cache\Repository;
use Pterodactyl\Http\Controllers\Controller;
use Pterodactyl\Extensions\Spatie\Fractalistic\Fractal;
use Pterodactyl\Transformers\Api\Client\StatsTransformer;
use Pterodactyl\Repositories\Wings\DaemonServerRepository;
use Pterodactyl\Contracts\Repository\EggRepositoryInterface;
use Pterodactyl\Traits\Controllers\PlainJavascriptInjection;
use Pterodactyl\Contracts\Repository\NodeRepositoryInterface;
use Pterodactyl\Contracts\Repository\UserRepositoryInterface;
use Pterodactyl\Contracts\Repository\ServerRepositoryInterface;
use Pterodactyl\Contracts\Repository\DatabaseRepositoryInterface;
use Pterodactyl\Contracts\Repository\AllocationRepositoryInterface;

class StatisticsController extends Controller
{
    use PlainJavascriptInjection;

    private $allocationRepository;

    private $databaseRepository;

    private $eggRepository;

    private $nodeRepository;

    private $serverRepository;

    private $userRepository;
	
	private $cache;
	
	private $repository;
	
	private $fractal;

    public function __construct(
        AllocationRepositoryInterface $allocationRepository,
        DatabaseRepositoryInterface $databaseRepository,
        EggRepositoryInterface $eggRepository,
        NodeRepositoryInterface $nodeRepository,
        ServerRepositoryInterface $serverRepository,
        UserRepositoryInterface $userRepository,
		Repository $cache,
		DaemonServerRepository $repository,
		Fractal $fractal
    ) {
        $this->allocationRepository = $allocationRepository;
        $this->databaseRepository = $databaseRepository;
        $this->eggRepository = $eggRepository;
        $this->nodeRepository = $nodeRepository;
        $this->serverRepository = $serverRepository;
        $this->userRepository = $userRepository;
		$this->cache = $cache;
		$this->repository = $repository;
		$this->fractal = $fractal;
    }

    public function index()
    {
        $servers = $this->serverRepository->all();
        $nodes = $this->nodeRepository->all();
        $usersCount = $this->userRepository->count();
        $eggsCount = $this->eggRepository->count();
        $databasesCount = $this->databaseRepository->count();
        $totalAllocations = $this->allocationRepository->count();
        $suspendedServersCount = $this->serverRepository->getSuspendedServersCount();

        $totalServerRam = 0;
        $totalNodeRam = 0;
        $totalServerDisk = 0;
        $totalNodeDisk = 0;
        foreach ($nodes as $node) {
            $stats = $this->nodeRepository->getUsageStatsRaw($node);
            $totalServerRam += $stats['memory']['value'];
            $totalNodeRam += $stats['memory']['max'];
            $totalServerDisk += $stats['disk']['value'];
            $totalNodeDisk += $stats['disk']['max'];
        }
		
		$serverstatus = [];
		foreach($servers as $server) {
			$key = "resources:{$server->uuid}";
			$stats = $this->cache->remember($key, Carbon::now()->addSeconds(20), function () use ($server) {
				return $this->repository->setServer($server)->getDetails();
			});

			$serverstatus[$server->uuid] = $this->fractal->item($stats)
				->transformWith(StatsTransformer::class)
				->toArray();
		}

        $this->injectJavascript([
            'servers' => $servers,
            'suspendedServers' => $suspendedServersCount,
            'totalServerRam' => $totalServerRam,
            'totalNodeRam' => $totalNodeRam,
            'totalServerDisk' => $totalServerDisk,
            'totalNodeDisk' => $totalNodeDisk,
            'nodes' => $nodes,
            'serverstatus' => $serverstatus,
        ]);

        return view('admin.statistics', [
            'servers' => $servers,
            'nodes' => $nodes,
            'usersCount' => $usersCount,
            'eggsCount' => $eggsCount,
            'totalServerRam' => $totalServerRam,
            'databasesCount' => $databasesCount,
            'totalNodeRam' => $totalNodeRam,
            'totalNodeDisk' => $totalNodeDisk,
            'totalServerDisk' => $totalServerDisk,
            'totalAllocations' => $totalAllocations,
        ]);
    }
}