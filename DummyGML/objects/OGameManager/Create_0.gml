/// @description Insert description here

// --- PARTICLES ---
var _p1 = part_type_create();
part_type_life(_p1, 30, 50);
part_type_color_rgb(_p1, 150, 200, 50, 100, 150, 200);
part_type_gravity(_p1, 0.2, 270); 
part_type_shape(_p1, pt_shape_disk);
part_type_size(_p1, 0.1, 0.5, 0, 0);
part_type_alpha3(_p1, 0.5, 0.3, 0.1);
global.gravityParticleDown = _p1;

_p1 = part_type_create();
part_type_life(_p1, 30, 50);
part_type_color_rgb(_p1, 150, 200, 50, 100, 150, 200);
part_type_gravity(_p1, 0.2, 90);
part_type_shape(_p1, pt_shape_disk);
part_type_size(_p1, 0.1, 0.5, 0, 0);
part_type_alpha3(_p1, 0.5, 0.3, 0.1);
global.gravityParticleUp = _p1;


global.yDeath = room_height - .5 * sprite_get_height(tester);

global.pSystem = part_system_create();
global.pEmitter = part_emitter_create(global.pSystem);

var _p1 = part_type_create();
part_type_direction(_p1, 0, 359, 0, 0);
part_type_life(_p1, room_speed, room_speed * 2);
part_type_gravity(_p1, 1, 270);
part_type_shape(_p1, pt_shape_ring);
part_type_speed(_p1, 20, 35, 0.01, 0);
part_type_size(_p1, 0.1, 1.5, 0.05, 0);
part_type_color_mix(_p1, c_grey, c_aqua)
global.death_particle = _p1;

// -----------------


global.attempts = 1;

blackRectangleAlpha = 0;
