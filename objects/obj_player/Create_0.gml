//
// Movement
//
Position = Vector2(x, y);
Velocity = Vector2(0, 0);

input_dir = 0;

can_move = true;
is_moving = false;

hsp = 0;
vsp = 0;

target_hsp = 0;
target_vsp = 0;

move_spd = 1;

accel = 0.1;
target_accel = accel;

//
// Animation
//
flipped = false;

scale = Vector2(1,1);

rotation = 0;

draw_color = c_white;
draw_alpha = 1;