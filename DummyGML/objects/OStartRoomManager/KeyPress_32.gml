/// @description go to game
if (not fanfareHasPlayed) {
	audio_play_sound(StartSound, 1, false);
	alarm[0] = 60;
	alarm[1] = 1;
	fanfareHasPlayed = true;
}