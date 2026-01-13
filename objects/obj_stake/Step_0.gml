var current_state = state_node.Query();

if(distance_to_object(obj_spark) < activation_distance) {
	obj_spark.player_affected_wind_speed = 0;
	animate_activation(current_state);
	
	counter--;
}
else {
	obj_spark.player_affected_wind_speed = 0.8;
	animate_deactivation(current_state);
}

image_speed = image_speed_direction;

if(counter <= 0) room_goto(rm_game);