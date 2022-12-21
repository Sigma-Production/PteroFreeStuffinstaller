<?php

namespace Pterodactyl\Models;

use Illuminate\Database\Eloquent\Model;

class ParticleJS extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'particles_js';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'enabled',
        'color',
        'preset',
        'custom',	
        'custom_enabled',
        'interactive'
    ];
}
