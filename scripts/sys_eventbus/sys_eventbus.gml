EV = {
	STATE_CHANGED: "on_state_changed",
	BUTTON_PRESSED: "on_button_pressed"
}; // TODO

function sys_eventbus() {
    return {
        listeners: ds_map_create(),

        Subscribe: function(event_name, fn) {
            if (!ds_map_exists(self.listeners, event_name)) {
                self.listeners[? event_name] = [];
            }
            array_push(self.listeners[? event_name], fn);
        },

        Unsubscribe: function(event_name, fn) {
            if (ds_map_exists(self.listeners, event_name)) {
                var arr = self.listeners[? event_name];
                for (var i = array_length(arr) - 1; i >= 0; i--) {
                    if (arr[i] == fn) array_delete(arr, i, 1);
                }
            }
        },

        Emit: function(event_name, ctx) {
            if (ds_map_exists(self.listeners, event_name)) {
                var arr = self.listeners[? event_name];
                for (var i = 0; i < array_length(arr); i++) {
                    arr[i](ctx);
                }
            }
        },

        Clear: function() {
            ds_map_clear(self.listeners);
        }
    };
}
