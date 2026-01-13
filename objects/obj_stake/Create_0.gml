image_speed_direction = 0;

activation_distance = 32;

counter = 120;

state_node = sys_statenode("stake_01", NodeState.Deactivated, true);

global.WorldFlags.Set("stake.01.lit", false);

function animate_activation(current_state) {
	if(image_index != image_number-1)
		image_speed_direction = 1;	
	else {
		image_speed_direction = 0;
		state_node.Activate();
	}
}

function animate_deactivation(current_state) {
	if(image_index != 0)
		image_speed_direction = -1;	
	else {
		image_speed_direction = 0;
		state_node.Deactivate();
	}
}