extends Node2D
@onready var lblReloj = $lblReloj
@onready var lblTexto1 = $lblTexto1
@onready var lblTexto2 = $lblTexto2
@onready var lblTexto3 = $lblTexto3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lblReloj.text = "6:00 PM"
	lblTexto1 = ""
	lblTexto2 = ""
	lblTexto3 = ""


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
