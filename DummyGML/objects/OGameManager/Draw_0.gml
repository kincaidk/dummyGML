/// @description draw death zone line

draw_line_color(0, global.yDeath, room_width, global.yDeath, c_red, c_red);
draw_set_font(FgridText);
draw_set_color(c_black);
for (var i=0; i < 500; i++) {
	draw_text(i * 32, room_height - 200, string(i));
}

draw_set_color(c_white);
for (var i = 0; i < room_width; i+= 64) {
	draw_line_width(i, 0, i, room_height, 2);	
}

