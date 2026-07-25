extends Node2D

var scenario_index = 0
var started = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var return_positions = [
	Vector2(900, 500),
	Vector2(900, 500),
	Vector2(900, 380),
	Vector2(1000, 380),
	Vector2(900, 500),
	Vector2(900, 500) 
]

func  get_return_position():
	return return_positions[scenario_index]		

var start_positions = [ 	
	Vector2(900, 500),
	Vector2(300, 500),
	Vector2(300, 530),
	Vector2(150, 580) 
]
	
func get_start_position():
	return start_positions[scenario_index]

func update_objs_state(value):
	print(value)

func start():
	started = true
	
func hide_tip():
	pass
