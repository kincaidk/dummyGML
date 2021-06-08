/// @description 

/*
on_ground = place_meeting(x, y + 1, OGround);
var jump = keyboard_check_pressed(vk_space) and on_ground;

if (jump){
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
*/
///////////////////////////////////////////////////////////////////


//Set variables
var on_ground = place_meeting(x, y + 1, OGround);
var jump = keyboard_check_pressed(vk_space) and on_ground;


// Move to the right;
x += hsp;


//Handle horizontal collision (DEATH)
var imminentHorizontalGroundCollision = place_meeting(x + hsp, y, OGround);
if (imminentHorizontalGroundCollision) {
	instance_destroy();
}


//Update vsp depending on if 
if (on_ground) {
	vsp = 0;
} else {
	vsp += grv;
}


//Handle jump
if (jump) {
	vsp = jumpSpeed;
}


//Handle vertical collision
var imminentVerticalGroundCollision = place_meeting(x, y + vsp, OGround);
if (imminentVerticalGroundCollision) {
	if (vsp < 0) {
		//Handles upward velocity
		while (not place_meeting(x, y - 1, OGround)) {
			y--;
		}
	} else {
		//Handles downward velocity
		while (not place_meeting(x, y + 1, OGround)) {
			y++;
		}
	}
	
	vsp = 0;
}


//Move vertically
y += vsp;











