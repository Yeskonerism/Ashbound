function event_bootstrap(){
	// Stake testing
	global.EventBus.Subscribe("on_state_changed", function(ctx) {
		global.Debug.Write($"on_state_changed ( {ctx.node_id} -> {ctx.state} )", "GLOBAL");	
	});
	
	// Button testing
	global.EventBus.Subscribe("on_button_pressed", function(ctx) {
		global.Debug.Write($"Button {ctx.button} pressed!", "GLOBAL");
	});
	
	// WORLD FLAG TESTING
	global.EventBus.Subscribe("on_world_flag_change", function(ctx) {
		global.Debug.Write($"on_world_flag_change ( {ctx.flag} -> {ctx.value} )", "GLOBAL");
	});
	
	global.EventBus.Subscribe("on_world_flag_set", function(ctx) {
		global.Debug.Write($"on_world_flag_set ( {ctx.flag} - {ctx.value} )", "GLOBAL");
	});
}