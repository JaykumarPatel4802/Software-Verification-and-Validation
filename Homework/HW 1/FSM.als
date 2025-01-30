one sig FSM {
	start: set State,
	stop: set State
}

sig State {
	transition: set State
}

// Part A
pred OneStartAndStop {
	// FSM only has one start state.-- TODO: Your code starts here.
	// FSM only has one stop state.-- TODO: Your code starts here.
	#FSM.start = 1 and #FSM.stop = 1
}

// Part B
pred ValidStartAndStop() {
	// The start state is different from the stop state.-- TODO: Your code starts here.
	// No transition ends at the start state.-- TODO: Your code starts here.
	// No transition begins at the stop state.-- TODO: Your code starts here.
	FSM.start != FSM.stop
	all s: State | FSM.start not in s.transition
	FSM.stop.transition = none
	// all s:State | s not in FSM.stop.transition
}

// Part C
pred Reachability() {
	// All states are reachable from the start state.-- TODO: Your code starts here.
	// The stop state is reachable from any state.-- TODO: Your code starts here.
	all s: State | s in FSM.start.*transition
	all s: State | FSM.stop in s.*transition
}

run {OneStartAndStop and ValidStartAndStop and Reachability}
