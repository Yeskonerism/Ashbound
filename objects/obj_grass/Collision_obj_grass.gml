sprite_w = sprite_get_width(sprite_index);

if(other.y > (y-sprite_w/2) || other.x > (x-sprite_w/4) || other.x < (x+sprite_w/4))
	instance_destroy(other)