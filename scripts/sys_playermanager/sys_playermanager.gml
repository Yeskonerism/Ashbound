function sys_playermanager(player_object){
	return {
		_player_object: player_object,
		
		Exists: function() {
			return instance_exists(_player_object);
		},
		
		Get: function() {
			return (self.Exists()) ? _player_object : noone;
		},
		
		Exec: function(fn) {
			if(!self.Exists()) {
				global.Debug.Write("Player object: non-existent", "WARN");
				return;
			}
			
			return fn(_player_object);
		}
	}
}