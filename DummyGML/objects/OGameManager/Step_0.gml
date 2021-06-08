/// @description 
/* ESCAPE does this now.
	if (keyboard_check_pressed(vk_enter)) {
		game_restart();
	}
*/
var playerIsDead = instance_number(OPlayer) == 0;
if (playerIsDead) {
	blackRectangleAlpha += 0.02;
} else {
	blackRectangleAlpha = 0;
}
