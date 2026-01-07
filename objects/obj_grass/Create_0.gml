draw_color = c_white;
draw_alpha = 1;

rotation = 0 //random_range(2,-2);

// Normalize Y to 0..1
var t = y / room_height;

// Darker closer to bottom
var brightness = lerp(255, 200, t);

// Add *small* noise, not full random
brightness += random_range(-10, 10);
brightness = clamp(brightness, 190, 255);

draw_color = make_colour_hsv(0, 0, brightness);

image_speed = 0.5//random_range(0,1);
image_index = 0//random_range(0, image_number);

if(irandom_range(0, 400) == 67) {
	sprite_index = choose(spr_flowers, spr_more_flowers);	
}