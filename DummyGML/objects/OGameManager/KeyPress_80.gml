/// @description Insert description here
// You can write your code in this editor

pause = !pause;
if (pause) {
	if (instance_number(OPlayer) > 0) {
		with(OPlayer) {
			other.temphsp = hsp;
			other.tempvsp = vsp;
			paused = true;
		}
		OPlayer.hsp = 0;
		OPlayer.vsp = 0;
	}
	audio_pause_sound(Music);
} else {
	if (instance_number(OPlayer) > 0) {
		OPlayer.hsp = temphsp;
		OPlayer.vsp = tempvsp;
		with (OPlayer) {
			paused = false;
		}
	}
	audio_resume_sound(Music);
}