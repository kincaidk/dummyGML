/// @description Start music
if (room == Level1) {
	global.MUSIC = audio_play_sound(Music, 1, true);
	audio_sound_gain(global.MUSIC, .75, 0);
}