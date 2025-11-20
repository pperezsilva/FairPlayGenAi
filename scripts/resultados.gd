extends Control

var puntuacion = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	if global.paragraph_data[0]["requerimiento"] == 1 and global.paragraph_data[0]["correcta"] == true:
		puntuacion += 2
		$TablonResultados/Parrafo1/R1.text = "Preciso"
		$TablonResultados/Parrafo1/R1.modulate = Color(0.2, 0.8, 0.2)
	else:
		$TablonResultados/Parrafo1/R1.text = "Errado"
		$TablonResultados/Parrafo1/R1.modulate = Color(0.9, 0.2, 0.2) 
	
	if global.paragraph_data[1]["requerimiento"] == 2 and global.paragraph_data[1]["correcta"] == true:
		puntuacion += 2
		$TablonResultados/Parrafo2/R2.text = "Preciso"
		$TablonResultados/Parrafo2/R2.modulate = Color(0.2, 0.8, 0.2)
	else:
		$TablonResultados/Parrafo2/R2.text = "Errado"
		$TablonResultados/Parrafo2/R2.modulate = Color(0.9, 0.2, 0.2)
	
	if global.paragraph_data[2]["requerimiento"] == 3 and global.paragraph_data[2]["correcta"] == true:
		puntuacion += 2
		$TablonResultados/Parrafo3/R3.text = "Preciso"
		$TablonResultados/Parrafo3/R3.modulate = Color(0.2, 0.8, 0.2) 
	else:
		$TablonResultados/Parrafo3/R3.text = "Errado"
		$TablonResultados/Parrafo3/R3.modulate = Color(0.9, 0.2, 0.2)
	
	match global.usoIA:
		0:
			$TablonResultados/IAuse/RIAuse.text = "Sin uso"
			puntuacion += 2
		1:
			$TablonResultados/IAuse/RIAuse.text = "Irresponsable"
			$TablonResultados/IAuse/RIAuse.modulate = Color(0.9, 0.2, 0.2)
			puntuacion += 0
		2:
			$TablonResultados/IAuse/RIAuse.text = "Dudoso"
			$TablonResultados/IAuse/RIAuse.modulate = Color(1.0, 0.9, 0.2)
			puntuacion += 1
		3:
			$TablonResultados/IAuse/RIAuse.text = "Responsable"
			$TablonResultados/IAuse/RIAuse.modulate = Color(0.2, 0.8, 0.2) 
			puntuacion += 2
		_:
			$TablonResultados/IAuse/RIAuse.text = "???"
			puntuacion += 0
		
	if global.valorTiempoFinal < global.valorTiempoLimite:
		puntuacion += 2
		$TablonResultados/Tiempo/RTiempo.text = global.tiempoFinal
		$TablonResultados/Tiempo/RTiempo.modulate = Color(0.2, 0.8, 0.2)
	else:
		$TablonResultados/Tiempo/RTiempo.text = global.tiempoFinal
		$TablonResultados/Tiempo/RTiempo.modulate = Color(0.9, 0.2, 0.2)
	
	
	$TablonResultados/Calificacion/RCalificacion.text = str(puntuacion)
	
	$AnimationTablonResultados.play("TablonAbajo")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
