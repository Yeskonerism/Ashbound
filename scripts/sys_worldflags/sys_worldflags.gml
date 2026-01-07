function sys_worldflags(){
	return {
		flags: {},
		
		Get: function(flag, default_value = false) {
			if (!variable_struct_exists(self.flags, flag)) return default_value;
			return struct_get(self.flags, flag);	
		},
		
		Set: function(flag, value) {
			var existed = variable_struct_exists(self.flags, flag);
			var event_name = (existed) ? "on_world_flag_change" : "on_world_flag_set";
			
			struct_set(self.flags, flag, value);
			
			global.EventBus.Emit(event_name, { flag: flag, value: value } );
		}
	}
}