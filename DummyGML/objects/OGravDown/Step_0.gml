/// @description gravity particle emission

var particleEmitter = part_emitter_create(global.pSystem);

var particleX = irandom_range(bbox_left, bbox_right);
part_emitter_region(global.pSystem, particleEmitter, particleX, particleX, y, y, ps_shape_line, ps_distr_linear);
part_emitter_burst(global.pSystem, particleEmitter, global.gravityParticleDown, 1);

part_emitter_destroy(global.pSystem, particleEmitter);
