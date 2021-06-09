/// @description Increment global.attempts.
if (room != StartRoom) {
	global.attempts++;
	room_restart();
}
