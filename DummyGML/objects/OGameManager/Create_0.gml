/// @description Insert description here
// You can write your code in this editor

global.yDeath = room_height - .5 * sprite_get_height(tester);
global.MUSIC = audio_play_sound(Music, 1, true);
audio_sound_gain(global.MUSIC, .75, 0);