/// @description emit particles
part_emitter_region(global.pSystem, global.pEmitter, x, x, y, y, ps_shape_ellipse, ps_distr_gaussian);
part_emitter_burst(global.pSystem, global.pEmitter, global.death_particle, deathParticleCount);

var deathSound = audio_play_sound(GameEnd, 1, false);
audio_sound_gain(deathSound, 0.20, 0);

//Restarts room after a delay. Increments global.attempts.
with (OGameManager) {
	alarm[0] = room_speed * 1.5;
}
