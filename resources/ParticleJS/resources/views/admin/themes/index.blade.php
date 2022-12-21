@extends('layouts.admin')
@include('partials/admin.settings.nav', ['activeTab' => 'advanced'])

@section('title')
    Theme Settings
@endsection

@section('content-header')
    <h1>Theme Settings<small>Configure Theme settings for Pterodactyl</small></h1>
    <ol class="breadcrumb">
        <li><a href="{{ route('admin.index') }}">Admin</a></li>
        <li class="active">Settings</li>
    </ol>
@endsection

@section('content')
    <div class="row">
        <div class="col-xs-12">
            <form action="" method="POST">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Theme settings</h3>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="form-group col-md-2">
                                <!-- enable/disable theme -->
                                <label class="control-label">Enable Theme</label>
                                <div>
                                    <select class="form-control" name="enabled">
                                        <option value="false"> Disabled</option>
                                        <option value="true" @if (old('enabled', $particlejs->enabled == 'true')) selected @endif>Enabled
                                        </option>
                                    </select>
                                    <p class="text-muted small">Enable or disable the theme</p>
                                </div>
                            </div>
                            <div class="form-group col-md-2">
                                <label class="control-label">Background Color</label>
                                <div>
                                    <input required type="color" class="form-control" name="color"
                                        value="{{ old('color', $particlejs->color) }}" />
                                    <p class="text-muted small">Enter the color the background would be</p>
                                </div>
                            </div>
                            <div class="form-group col-md-2">
                                <label class="control-label">Particles JS preset</label>
                                <div>
                                    <!-- dropdown -->
                                    <select name="preset" class="form-control">
                                        <!-- options: fireworks, bubbles, snow, confetti, custom -->
                                        @foreach ($presets as $preset)
                                            <option value="{{ $preset }}"
                                                @if (old('preset', $particlejs->preset) == $preset) selected @endif>{{ $preset }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="form-group col-md-2">
                                <label class="control-label">Enable Interactive</label>
                                <div>
                                    <select class="form-control" name="interactive">
                                        <option value="false"> Disabled</option>
                                        <option value="true" @if (old('interactive', $particlejs->interactive == 'true')) selected @endif>Enabled
                                        </option>
                                    </select>
                                    <p class="text-muted small">Enable or disable the interactive particles</p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-2">
                                <label class="control-label">Enable Custom</label>
                                <div>
                                    <select class="form-control" name="custom_enabled">
                                        <option value="false"> Disabled</option>
                                        <option value="true" @if (old('custom_enabled', $particlejs->custom_enabled == 'true')) selected @endif>Enabled
                                        </option>
                                    </select>
                                    <p class="text-muted small">Enable or disable the custom json</p>
                                </div>
                            </div>
                            <div class="form-group col-md-2">
                                <label class="control-label">Custom JSON</label>
                                <div>
                                    <textarea class="form-control" name="custom" rows="5">{{ old('custom', $particlejs->custom) }}</textarea>
                                    <p class="text-muted small">Enter the custom json(this will override background, preset
                                        and interactive!)</p>
                                </div>
                            </div>
                        </div>
                        <div class="box-footer">
                            {{ csrf_field() }}
                            <div class="pull-right">
                                <button type="submit" name="_method" value="PATCH"
                                    class="btn btn-sm btn-primary pull-right">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection
