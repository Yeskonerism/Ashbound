x += lengthdir_x(part_spd, dir);
y += lengthdir_y(part_spd, dir);

if(x > room_width || x < 0-64 || y > room_height || y < 0-64) instance_destroy(self);

image_angle += spin_spd*spin_dir;