draw_sprite_ext(sprite_index, image_index, Position.X, Position.Y, scale.X, scale.Y, rotation, draw_color, draw_alpha);

var radius = 32;

draw_circle(Position.X, Position.Y, radius, true);
draw_line(
    Position.X,
    Position.Y,
    Position.X + Velocity.X * radius,
    Position.Y + Velocity.Y * radius
);