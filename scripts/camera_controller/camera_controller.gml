function camera_controller(_target, _inbounds, _bounds = 1024) {
	return {
		// --- Core Data ---
		follow: _target,
		inbounds: _inbounds,
		bounds: _inbounds && !is_undefined(_bounds) ? _bounds : 1024,
		
		camera_position: Vector2(_target.x, _target.y),
		camera_to:  Vector2(0,0),

		// --- Config ---
		lerp_amount: 6.25,

		// --- Shake ---
		shake_power: 2.5,
		shake_value: 0,
		
		half_w: CAMERA_W * 0.5,
		half_h: CAMERA_H * 0.5,

		update_tracking: function() {
			if (!instance_exists(self.follow)) return;
			
			self.camera_to.X = self.follow.x; // could probably also use Position.X/Y?
			self.camera_to.Y = self.follow.y;
			
			self.camera_position.X = lerp(self.camera_position.X, self.camera_to.X, 1 / self.lerp_amount);
			self.camera_position.Y = lerp(self.camera_position.Y, self.camera_to.Y, 1 / self.lerp_amount);
		},
		
		update_bounds: function() {
			var x_clamp = clamp(self.camera_position.X - self.half_w, -self.bounds, room_width - CAMERA_W + self.bounds);
			var y_clamp = clamp(self.camera_position.Y - self.half_h, -self.bounds, room_height - CAMERA_H + self.bounds);
			
			return Vector2(x_clamp, y_clamp);
		},
		
		apply_screenshake: function() {
			if (self.shake_value == 0) return;
			
			self.shake_value = max(self.shake_value - 0.05, 0);
			var shake_strength = sqr(self.shake_value) * self.shake_power;

			self.camera_position.X += random_range(-shake_strength, shake_strength);
			self.camera_position.Y += random_range(-shake_strength, shake_strength);
		},
		
		apply_cursor_look: function() {
			/*if (!instance_exists(obj_cursor) || !self.look_cursor)*/ return Vector2(0,0);
			
			var cam_x = self.camera_position.X;
			var cam_y = self.camera_position.Y;

			var dx = obj_cursor.x - cam_x;
			var dy = obj_cursor.y - cam_y;

			var dist = point_distance(0, 0, dx, dy);
			var dir = point_direction(0, 0, dx, dy);

			var look_strength= clamp(dist / 200, 0, 1);
			var max_offset_x = 160;
			var max_offset_y = 120;

			var offset_x = lengthdir_x(look_strength * max_offset_x, dir);
			var offset_y = lengthdir_y(look_strength * max_offset_y, dir);

			return Vector2(offset_x, offset_y);
		},
		
		apply_camera: function(pos_x, pos_y) {
			camera_set_view_pos(CAMERA, pos_x, pos_y);
			
			if(!self.angle_it || !instance_exists(self.follow)) return;

			var dx = self.follow.x - room_width * 0.5;
			var cam_angle = clamp(dx / 2000, -2, 2);

			camera_set_view_angle(CAMERA, cam_angle);
		},

		/// @method update
		update: function(_look_cursor, _angle_it) {
			self.look_cursor = _look_cursor;
			self.angle_it = _angle_it;
			
			self.update_tracking();
			self.apply_screenshake();
			
			var cursor_offset = self.apply_cursor_look();
			self.camera_position.X += cursor_offset.X;
			self.camera_position.Y += cursor_offset.Y;
			
			var position_clamped = self.update_bounds();
			self.apply_camera(position_clamped.X, position_clamped.Y);
		},

		/// @method screenshake
		screenshake: function(_power) {
			self.shake_value = min(self.shake_value + 1, 1);
			self.shake_power = max(self.shake_power, _power);
		},
		
		/// @method switch_follow
		switch_follow: function(_obj) {
			self.follow = _obj;
		}
	};
}
