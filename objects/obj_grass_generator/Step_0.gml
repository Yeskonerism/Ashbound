if(!grass_generated) {
	var _x = 0;
	var _y = 0;
	
	var _bound = 8;
	var _rand_bound = 50;
	
	for(_y = 0; _y < room_height; _y += _bound) {
		for(_x = 0; _x < room_width; _x += _bound) {
			instance_create_layer(_x + irandom_range(_rand_bound,100), _y + irandom_range(-1, 1), "Environment", obj_grass);
		}
	}
	
	grass_generated = true;
}