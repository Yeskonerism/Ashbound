function sys_debug(){
	return {
		debug_log: [],
		
		Write: function(str, level = "INFO") {
			var final_level = (argument_count > 1)  ? string(level) : "INFO";
			array_push(self.debug_log,  "[" + final_level + "] " + string(str));
			
			show_debug_message("[" + final_level + "] " + string(str));
		},
		
		StringBuilder: function() {
			var built_string = "";
			
			for(var i = 0; i < self.Lines(); i++) {
				built_string += string(self.debug_log[i]);
				built_string += "\n";
			}
			
			return built_string;
		},
		
		Clear: function() {
			self.debug_log = [];	
		},
		
		ClearCount: function(count) {
			if(count == 0) return;
			if(self.Lines() <= count) return;
			
			var reserve = self.debug_log[self.Lines() - 1];
			self.Clear();
			
			reserve = string_split(reserve, "] ");
			
			self.Write(reserve[1]);
		},
		
		Lines: function() {
			return array_length(self.debug_log);
		}
	}
}