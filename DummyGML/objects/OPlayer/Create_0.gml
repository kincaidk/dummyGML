/// @description set mask
imgXScale = image_xscale / (sprite_width / sprite_get_width(SPlayer));
imgYScale = image_yscale / (sprite_height / sprite_get_height(SPlayer));
mask_index = SPlayer;
image_speed = 1;
show_debug_message(string(sprite_width));
sub_img = 0;