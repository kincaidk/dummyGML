

//Set variables
var on_ground = place_meeting(x, y + sign(placeMeetingNum), OGround);
var jump = keyboard_check(vk_space) and on_ground;



//Update vsp depending on if 
if (on_ground) {
	vsp = 0;
	
	rotationAngle = 0;
} else {
	if (gravInverse) {
		vsp -= grv * !paused;
	} else {
		vsp += grv * !paused;	
	}
	
	show_debug_message("adding to vsp: " + string(grv * !paused));
	show_debug_message("vsp: " + string(vsp));
	rotationAngle -= rotationSpeed * !paused;
}


//Handle jump
if (jump) && (!paused){
	vsp = jumpSpeed * sign(placeMeetingNum);
	//check to see if player jumped while inside safe wall
	//if so, player death.
	var thing = collision_rectangle(x,y, x + sprite_get_width(SPlayer), y + sprite_get_height(SPlayer), OgroundSafe, true, false);
	if (thing != noone) {
		alarm[0] = 1;
	}
	
	jumpSound = audio_play_sound(Jump, 1, false);
	audio_sound_set_track_position(jumpSound, .3);
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
		//if (sound != undefined) && (audio_is_playing(sound)){
			//audio_stop_sound(sound);
		//}
		//landSound = audio_play_sound(Land, 1, false);
	}
	
	vsp = 0;
}

var spikeyDeath = place_meeting(x + hsp, y + vsp, OSpike);
if (spikeyDeath) {
	alarm[0] = 1;
} 
// Move to the right;
x += hsp + boostValue;


//Handle horizontal collision (DEATH)
var imminentHorizontalGroundCollision = place_meeting(x + hsp, y, OBlock);
if (imminentHorizontalGroundCollision) {
	alarm[0] = 1;
	show_debug_message("IMMINENT HORZONTAL COLLISION");
}
//Move vertically

	//show_debug_message("current y: " + string(y) + " vsp: " + string(vsp) + " new y: " + string(y - vsp));
	//show_debug_message("Grounded? " + string(on_ground));
	//y -= vsp + yboostValue;

y += vsp + yboostValue;




if (y > room_height - .5 * sprite_get_height(tester)) {
	alarm[0] = 1;	
}


sub_img += 0.20;


//handle boost pad
var boostPad = instance_place(x, y + vsp, OSpeedBoost);
if (boostPad) {
	boosted = true;
	boostValue = boostPad.XBoostValue;
	yboostValue = boostPad.YBoostValue
	deceleration = .005;
}
if (boosted) {
	boostValue = max(0, boostValue  * .98);
	yboostValue = max(0, yboostValue  * .98);
	//check if we're still boosted
	if (round(boostValue) == 0) {
		boostValue = 0;
		boosted = false;
	}	
}

//handle grav up
var gravUpPad = instance_place(x, y + vsp, OGravUp);
if (gravUpPad && !gravInverse) {
	gravInverse = true;	
	placeMeetingNum = -1;
	imgYScale = -imgYScale;
}

//handle grav down
var gravDownPad = instance_place(x, y + vsp, OGravDown);
if (gravDownPad && gravInverse) {
	gravInverse = false;
	placeMeetingNum = 1;
	imgYScale = abs(imgYScale);
}