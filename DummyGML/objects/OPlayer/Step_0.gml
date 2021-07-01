

//Set variables
var on_ground = place_meeting(x, y + sign(placeMeetingNum), OGround);
var jump = keyboard_check(vk_space) and on_ground;



//Update vsp depending on if grounded
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
	
	//Handles the direction that the jump rotates in.
	if (gravInverse) {
		rotationAngle += rotationSpeed * !paused;
	} else {
		rotationAngle -= rotationSpeed * !paused;
	}
}

//handle jump pad
var jumpPad = instance_place(x, y + vsp, OJumpPad);
if (jumpPad) {
	show_debug_message("touched jumpboost " + string(jumpPad.YBoost) + " being added to: " + string(vsp));
	vsp -= jumpPad.YBoost * sign(placeMeetingNum);
	on_ground = false;
	with(jumpPad) {
		image_speed = 3;	
		image_index = 1;
	}
	var soundfx = audio_play_sound(JumpPad, 1, false);
	audio_sound_gain(soundfx, .25, 0);
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



// Kill player when they go out of bounds.
if (y > global.yDeathBottom || y < global.yDeathTop) {
	alarm[0] = 1;
}



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
	imgYScale = -abs(imgYScale);
}

//handle grav down
var gravDownPad = instance_place(x, y + vsp, OGravDown);
if (gravDownPad && gravInverse) {
	gravInverse = false;
	placeMeetingNum = 1;
	imgYScale = abs(imgYScale);
}

