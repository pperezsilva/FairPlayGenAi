extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$topic1.text = "Ventaja ambiental"
	$topic2.text = "Retos / Limitaciones"
	$topic3.text = "Aplicacion Practica"
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
