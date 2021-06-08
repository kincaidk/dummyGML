/// @description test

//returns id of ground obj - otherwise noone
//var something = instance_place(x + 1, y, other);
//if (something != noone) {
	//player die!
//	instance_destroy();
	
//}
//bottom collision
if (!on_ground && vsp > 0) {
	y = other.y - 1;
	vsp = 0;
	on_ground = true;
	show_debug_message("Changing on ground to true");
//top collision
} else if (!on_ground && vsp < 0) {

	vsp = 0;
	y = other.y + other.sprite_height + sprite_height;
}
