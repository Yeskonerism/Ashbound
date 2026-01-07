enum NodeState {
	Deactivated,
	Activated,
	Exhausted
}

function sys_statenode(_id, _state, _global_activation){
	return {
		node_id: _id,
		state: _state,
		global_activation: _global_activation,
		EventBus: _global_activation ? global.EventBus : sys_eventbus(),
		
		SetState: function(new_state) {
			self.state = new_state;
			EventBus.Emit("on_state_changed", { node_id: self.node_id, state: self.state });
		},
		
		Activate: function() {
			SetState(NodeState.Activated);
		},
		
		Deactivate: function() {
			SetState(NodeState.Deactivated);
		},
		
		Exhaust: function() {
			SetState(NodeState.Exhausted);
		},
		
		Revert: function() {
			SetState(NodeState.Deactivated);
		},
		
		Query: function() {
			return self.state;
		}
	}
}