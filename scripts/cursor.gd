extends CanvasLayer

@onready var custom_cursor = $TextureRectMouse

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Ocultar el cursor del sistema
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	custom_cursor.texture = preload("res://imagenes/cursor.png")
	custom_cursor.scale = Vector2(0.8, 0.8)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	custom_cursor.position = get_viewport().get_mouse_position()
