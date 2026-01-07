image_alpha -= 0.05;

if(image_alpha <= 0) instance_destroy(self);

image_xscale -= 0.025;
image_yscale -= 0.025;