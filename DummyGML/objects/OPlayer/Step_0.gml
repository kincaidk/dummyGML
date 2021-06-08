/// @description 


on_ground = place_meeting(x, y + 2, OGround);
var jump = keyboard_check_pressed(vk_space);

if (jump && on_ground){
	vsp = jumpSpeed;
	on_ground = false;
	show_debug_message("trying to jump");
}

x += hsp;

if (on_ground) {
	vsp = 0;
	
} else {
	vsp += grv;
}

//check collision up/down
collidedObject = collision_line(x, y, x, y + vsp, OGround, false, false);
if (collidedObject == noone) {
	//y += vsp;
} else {
	if (vsp < 0){
		//collision above
		//vsp = 0;
		//y = collidedObject.y + collidedObject.sprite_height;
		show_debug_message("colliding with something above");
	} else {
		//collision below	
		//y = collidedObject.y -1;
		//on_ground = true;
		//vsp = 0;
	}
	
}
y += vsp;
//horizontal collision detection
for (var i = 1; i < hsp; i++) {
	var die = (place_meeting(x + i, y, OBlock));
	if (die) {
		instance_destroy(id);	
	}
}
