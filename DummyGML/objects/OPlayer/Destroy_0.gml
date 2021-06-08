/// @description emit particles
part_emitter_region(global.pSystem, global.pEmitter, x, x, y, y, ps_shape_ellipse, ps_distr_gaussian);
part_emitter_burst(global.pSystem, global.pEmitter, global.death_particle, deathParticleCount);
