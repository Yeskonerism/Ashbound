var current_state = state_node.Query();

if(distance_to_object(obj_player) < 32) {
	if(current_state == NodeState.Deactivated) {
		state_node.Activate();
		
		global.WorldFlags.Set("stake.01.lit", true);
	}
} else {
	if(current_state == NodeState.Activated) {
		state_node.Exhaust();
		
		// PLAYER MANAGER TESTING
		global.PlayerManager.Exec(function(p) {
			p.x = 20;
			p.y = 20;
		});
		
		global.WorldFlags.Set("stake.01.lit", false);
	}	
}

image_index = current_state;