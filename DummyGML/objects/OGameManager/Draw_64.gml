/// @description Insert description here
// You can write your code in this editor

if (pause) {
	draw_set_font(FGameFont);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(window_get_width() / 2, window_get_height() / 2, "PAUSED");	
}