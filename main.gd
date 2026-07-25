extends Node2D

var logos_state = 0
var started_fim = false
var locations = ["Jardim", "Acervo", "Deposito"]
var current_location = 0	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AudioStreamPlayer.play()
	$Player.hide()
	$Timer.start(3)
	logos_state = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event):
	if event is InputEventScreenTouch and event.pressed == true:
		if $Jardim.started or $Acervo.started or $Deposito.started or started_fim:
			get_viewport().set_input_as_handled()
			print("Main unhandled input")
			_player_walk_to(event.position)
			
func _player_walk_to(pos):
	$Player.walk_to(pos)
	print(locations[current_location])
	var loc_node = get_node(locations[current_location])
	loc_node.hide_tip()
	$Indicator.set_position(pos-$Indicator.size/2)
	$Indicator.show()

func _on_timer_timeout() -> void:
	if logos_state == 1:
		$Logos.texture = load("res://imgs/02 - Logos.jpg")
		logos_state = logos_state+1
		$Timer.start(3)
	elif logos_state == 2:
		$Logos.texture = load("res://imgs/03-Logos.jpg")
		logos_state = logos_state+1
		$Timer.start(3)
	elif logos_state == 3:
		$Player.show()
		var loc = get_current_location_node()
		$Player.start(loc.get_return_position())
		logos_state = 0
		$Logos.hide()
		$Timer.stop()
		$Jardim.start()
	
func get_current_location_node():
	var location = locations[current_location]
	return get_node(location)

func _on_player_limite_direito() -> void:
	var loc = get_current_location_node()
	if loc != null:
		loc.update_objs_state(+1)
		$Player.end()
		$Player.start(loc.get_start_position())
		$Player.flip_horizontal(true)


func _on_player_limite_esquerdo() -> void:
	var loc = get_current_location_node()
	if loc != null:
		loc.update_objs_state(-1)
		$Player.end()
		$Player.start(loc.get_return_position())


func _on_jardim_leave() -> void:
	$Jardim.hide()
	$Player.current_forma = $Player.current_forma+1


func _on_acervo_leave() -> void:
	$Acervo.hide()
	$Player.current_forma = $Player.current_forma+1


func _on_audio_stream_player_finished() -> void:
	$AudioStreamPlayer.play()
