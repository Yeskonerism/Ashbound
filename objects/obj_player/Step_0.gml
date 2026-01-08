#region Input

// player keys
var key_left = keyboard_check(ord("A")); 
var key_right = keyboard_check(ord("D"));  
var key_up = keyboard_check(ord("W")); 
var key_down = keyboard_check(ord("S"));

#endregion

#region Player Movement

var input_x = key_right - key_left;
var input_y = key_down - key_up

// Check if player is moving or not
is_moving = (input_x != 0 || input_y != 0);

// movement calculation
if(can_move) {
	input_dir = Vector2(input_x, input_y);

	if(is_moving) {
		input_dir.Normalise();
		input_dir.Scale(move_spd);
	}
	
	hsp = lerp(hsp, input_dir.X, accel);
	vsp = lerp(vsp, input_dir.Y, accel);
	
	// horizontal collision
	if(!place_free(Position.X + Velocity.X, vsp)) {
		hsp = 0;
	}

	// vertical collision
	if(!place_free(Position.X, Position.Y + hsp)) {
		vsp = 0;
	}
	
	Velocity.X = hsp;
	Velocity.Y = vsp
}

Position.Add(Velocity);

if(!is_moving) accel = target_accel*2;
else accel = target_accel;

// SET POSITION BASED ON POSITION VECTOR
x = Position.X;
y = Position.Y;

#endregion

#region Animation

flipped = mouse_x < Position.X;
scale.X = (flipped) ? -1 : 1;

#endregion