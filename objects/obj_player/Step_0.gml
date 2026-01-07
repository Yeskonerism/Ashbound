#region Player Movement

// player keys
var key_left = keyboard_check(ord("A")); 
var key_right = keyboard_check(ord("D"));  
var key_up = keyboard_check(ord("W")); 
var key_down = keyboard_check(ord("S"));

// movement calculation
if(can_move) {
	target_hsp = move_spd * (key_right - key_left);
	target_vsp = move_spd * (key_down - key_up);

	// horizontal collision
	if(!place_free(x + hsp, y)) {
		hsp = 0;
	}

	hsp = lerp(hsp, target_hsp, accel);
	x += hsp;

	// vertical collision
	if(!place_free(x, y + vsp)) {
		vsp = 0;
	}

	vsp = lerp(vsp, target_vsp, accel);
	y += vsp;
}

if(target_hsp == 0 && target_vsp == 0) accel = target_accel*2;
else accel = target_accel;

#endregion

#region Animation

x_scale = (flipped) ? -1 : 1;
flipped = mouse_x < x;

#endregion