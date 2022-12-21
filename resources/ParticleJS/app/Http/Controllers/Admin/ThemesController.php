<?php

namespace Pterodactyl\Http\Controllers\Admin;

use Illuminate\View\View;
use Illuminate\View\Factory as ViewFactory;
use Pterodactyl\Http\Controllers\Controller;
use Pterodactyl\Models\ParticleJS;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;

use function PHPSTORM_META\map;

class ThemesController extends Controller
{
    /**
     * ThemesController constructor.
     */
    public function __construct(private ViewFactory $view)
    {
    }

    public function index(): View
    {
        $particlejs = ParticleJS::first();
        // Read folder public/assets/json 
        $jsons = glob(public_path('assets/json/*.json'));
        $jsons = array_map('basename', $jsons);
        $jsons = str_replace('.json', '', $jsons);

        return $this->view->make('admin.themes.index', [
            'particlejs' => $particlejs,
            'presets' => $jsons,
        ]);
    }

    public function update(Request $request): RedirectResponse
    {
        $this->validate($request, [
            'enabled' => 'required|string',
            'color' => 'required|string',
            'preset' => 'required|string',
            'interactive' => 'required|string',
            'custom_enabled' => 'required|string',
            'custom' => 'required|string',
        ]);

        $particlejs = ParticleJS::first();

        $particlejs->update([
            'enabled' => $request->input('enabled'),
            'color' => $request->input('color'),
            'preset' => $request->input('preset'),
            'interactive' => $request->input('interactive'),
            'custom_enabled' => $request->input('custom_enabled'),
            'custom' => $request->input('custom'),
        ]);

        return redirect()->route('admin.themes')->with('success', 'Theme updated successfully.');
    }
}