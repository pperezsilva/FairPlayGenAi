extends Node2D
@onready var lblReloj = $lblReloj
@onready var lblTexto1 = $lblTexto1
@onready var lblTexto2 = $lblTexto2
@onready var lblTexto3 = $lblTexto3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lblReloj.text = "8:00 PM"
	lblTexto1.text = "1.- Explica una ventaja ambiental de la energía solar."
	lblTexto2.text = "2.- Describe un reto o limitación de la energía solar."
	lblTexto3.text = "3.- Menciona una aplicación práctica de la energía solar."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
