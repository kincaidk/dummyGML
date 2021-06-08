/// @description draw text

draw_set_font(FGameFont);
draw_set_color(c_red);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(textAlpha);
draw_text(room_width / 2, room_height / 2, "THE POSSIBLE GAME!");
draw_text(room_width / 2, (room_height / 2) + 50, "PRESS SPACE TO START");
draw_set_alpha(1);