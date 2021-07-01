/// @description 
var subImageNumber = floor(sub_img)%image_number;
sub_img += 0.20;

//For more dancing!
if (subImageNumber == 2) {
	reverseXScale *= -1;
}

draw_sprite_ext(sprite_index, subImageNumber, x, y, imgXScale * reverseXScale, imgYScale, rotationAngle, c_white, 1);

//debug - draw mask
//draw_sprite_ext(mask_index,0,x,y,.5,1,0,c_aqua,0.5);