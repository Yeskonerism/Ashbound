function camera_controller(_target, _inbounds, _bounds = 1024) {
	return {
		// --- Core Data ---
		follow: _target,
		inbounds: _inbounds,
		bounds: _inbounds && !is_undefined(_bounds) ? _bounds : 1024,
		
		camera_x: _target.x,
		camera_y: _target.y,
		x_to: 0,
		y_to: 0,

		// --- Config ---
		lerp_amount: 6.25,

		// --- Shake ---
		do_screen_shake: false,
		shake_power: 2.5,
		shake_value: 0,

		/// @method update
		update: function(_look_cursor, _angle_it) {
			if (instance_exists(self.follow)) {
				self.x_to = self.follow.x;
				self.y_to = self.follow.y;
			}

			if (self.do_screen_shake) {
				self.shake_value = 1;
				self.do_screen_shake = false;
			}

			self.camera_x = lerp(self.camera_x, self.x_to, 1 / self.lerp_amount);
			self.camera_y = lerp(self.camera_y, self.y_to, 1 / self.lerp_amount);

			var half_w = CAMERA_W * 0.5;
			var half_h = CAMERA_H * 0.5;

			var x_clamp = clamp(self.camera_x - half_w, -self.bounds, room_width - CAMERA_W + self.bounds);
			var y_clamp = clamp(self.camera_y - half_h, -self.bounds, room_height - CAMERA_H + self.bounds);

			if (self.shake_value > 0) {
				self.shake_value = max(self.shake_value - 0.05, 0);
				var shake_strength = sqr(self.shake_value) * self.shake_power;

				x_clamp += random_range(-shake_strength, shake_strength);
				y_clamp += random_range(-shake_strength, shake_strength);
			}

			if (_look_cursor && instance_exists(obj_cursor)) {
				var dx = obj_cursor.x - self.camera_x;
				var dy = obj_cursor.y - self.camera_y;

				var dist = point_distance(0, 0, dx, dy);
				var dir = point_direction(0, 0, dx, dy);

				var look_scale = dist / 10;
				var max_offset_x = 160;
				var max_offset_y = 120;

				x_clamp += clamp(lengthdir_x(look_scale, dir), -max_offset_x, max_offset_x);
				y_clamp += clamp(lengthdir_y(look_scale, dir), -max_offset_y, max_offset_y);
			}

			camera_set_view_pos(view_camera[0], x_clamp, y_clamp);

			if (_angle_it && instance_exists(self.follow)) {
				var cam_angle = ((room_width * 0.5 - self.follow.x) + (room_height * 0.5 - self.follow.y)) / 360;
				camera_set_view_angle(CAMERA, cam_angle);
			}
		},

		/// @method screenshake
		screenshake: function(_power) {
			self.do_screen_shake = true;
			self.shake_power = _power;
		},
		
		/// @method switch_follow
		switch_follow: function(_obj) {
			self.follow = _obj;
		}
	};
}
