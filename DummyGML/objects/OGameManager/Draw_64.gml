/// @description Insert description here
// You can write your code in this editor

draw_set_font(FGameFont);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var windowWidth = window_get_width();
var windowHeight = window_get_height()

if (pause) {
	draw_text(windowWidth / 2, windowHeight / 2, "PAUSED");	
}

draw_set_color(c_maroon);
draw_text(windowWidth / 2, 20, "ATTEMPTS:  " + string(global.attempts));
draw_set_color(c_white);

//When player dies, this black rectangle fades in. (It covers the whole screen)
draw_set_alpha(blackRectangleAlpha)
draw_rectangle_color(0, 0, windowWidth, windowHeight, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

