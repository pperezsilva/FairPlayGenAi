extends Control
@onready var click: AudioStreamPlayer = $sndClick

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_aceptar_pressed() -> void:
	click.play(0.4)
	await get_tree().create_timer(0.2).timeout
	get_tree().reload_current_scene()


func _on_button_cancelar_pressed() -> void:
	click.play(0.4)
	hide()
