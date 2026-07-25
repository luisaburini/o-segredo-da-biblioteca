extends Node2D

var scenario_index = 0
var started = false
signal leave

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Saida/TouchScreenButton.hide()


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


func _on_saida_body_entered(body: Node2D) -> void:
	$Saida/TouchScreenButton.show()


func _on_saida_body_exited(body: Node2D) -> void:
	$Saida/TouchScreenButton.hide()


func _on_touch_screen_button_pressed() -> void:
	leave.emit()
