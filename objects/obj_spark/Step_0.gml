#region Player Movement

// player keys
var key_left = keyboard_check(ord("A")); 
var key_right = keyboard_check(ord("D"));  
var key_up = keyboard_check(ord("W")); 
var key_down = keyboard_check(ord("S"));

// movement calculation
if(can_move) {
	target_hsp = move_spd * (key_right - key_left) + 0.8;
	target_vsp = move_spd * (key_down - key_up);

	// horizontal collision
	if(!place_free(x + hsp, y)) {
		hsp = 0;
	}

	hsp = lerp(hsp, target_hsp, 0.05);
	x += hsp;

	// vertical collision
	if(!place_free(x, y + vsp)) {
		vsp = 0;
	}

	vsp = lerp(vsp, target_vsp, 0.05);
	y += vsp;
}

#endregion

if(target_hsp != 0 || target_vsp != 0) {
	var trail = instance_create_layer(x,y,"VFXSub",obj_spark_trail);
	trail.image_index = image_index;
}

if(target_hsp > 0) image_angle = lerp(image_angle, -10, 0.05);
else if(target_hsp < 0) image_angle = lerp(image_angle, 10, 0.05);
else image_angle = lerp(image_angle, 0, 0.5);