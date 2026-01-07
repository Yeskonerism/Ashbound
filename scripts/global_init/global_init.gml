function global_init(){
	// create random seed
	randomise();
	
	// camera macros
	#macro CAMERA		view_camera[0]
	#macro CAMERA_W		camera_get_view_width(CAMERA)
	#macro CAMERA_H		camera_get_view_height(CAMERA)
	#macro CAMERA_X		camera_get_view_x(CAMERA)
	#macro CAMERA_Y		camera_get_view_y(CAMERA)
	
	// Global systems initialisation
	global.EventBus = sys_eventbus();
	global.WorldFlags = sys_worldflags();
	
	global.Debug = sys_debug();
	
	global.PlayerManager = sys_playermanager(obj_player);
	
	// Subscribe global.EventBus listeners
	global.events_bootstrapped = false;
	
	if(!global.events_bootstrapped) {
		event_bootstrap();
		global.events_bootstrapped = true;
	}
}