extends Control
var pasos = ["paso1", "paso2"]
var cpasos = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MusicaCinematica.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_pressed() -> void:
	$TextureButton.hide()
	if cpasos >= 2:
		cpasos = 0
		get_tree().change_scene_to_file("res://escenas/Nivel.tscn")
	else:
		$Cinematica1.play(pasos[cpasos])
		cpasos += 1


func _on_cinematica_1_animation_finished(anim_name: StringName) -> void:
	$TextureButton.show()
