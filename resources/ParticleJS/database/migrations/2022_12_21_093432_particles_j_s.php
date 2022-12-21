<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('particles_js', function (Blueprint $table) {
            $table->id();
            $table->string('enabled')->default('true');
            $table->string('color')->default('#ffffff');
            $table->string('preset')->default('fireworks');
            $table->json('custom')->nullable();
            $table->string('custom_enabled')->default('false');
            $table->string('interactive')->default('false');
            $table->timestamps();
        });

        DB::table('particles_js')->insert([
            'enabled' => 'true',
            'color' => '#ffffff',
            'preset' => 'fireworks',
            'custom' => null,
            'custom_enabled' => 'false',
            'interactive' => 'false',
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('particles_js');
    }
};
