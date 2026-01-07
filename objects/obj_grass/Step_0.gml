var target_alpha = (place_meeting(x, y, obj_player) && obj_player.y < y) ? 0 : 1;

draw_alpha = lerp(
	draw_alpha, 
	target_alpha,
	0.15
);