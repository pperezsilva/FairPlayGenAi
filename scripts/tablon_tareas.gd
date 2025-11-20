extends Node2D
@onready var lblReloj = $lblReloj
@onready var lblTexto1 = $lblTexto1
@onready var lblTexto2 = $lblTexto2
@onready var lblTexto3 = $lblTexto3
@onready var lblTexto4 = $lblTexto4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lblReloj.text = "1:00 PM"
	lblTexto1.text = "LA ENERGIA SOLAR"
	lblTexto2.text = "1.- Ventaja ambiental de la energía solar."
	lblTexto3.text = "2.- Reto o limitación de la energía solar."
	lblTexto4.text = "3.- Aplicación práctica de la energía solar."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_btn_iniciar_pressed() -> void:
	$btnIniciar.hide()
