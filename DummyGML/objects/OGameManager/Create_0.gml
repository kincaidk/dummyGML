/// @description Insert description here
// You can write your code in this editor

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

global.MUSIC = audio_play_sound(Music, 1, true);
audio_sound_gain(global.MUSIC, .75, 0);
