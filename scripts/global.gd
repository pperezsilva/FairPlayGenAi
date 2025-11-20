extends Node

var seleccionado = ""

var usuarioOcupado = false

var parrafos = [0,0,0]

var parrafosFinales = ["","",""]

#####


var select = {        
	"texto": "",
	"requerimiento": "",
	"correcta": false
}

var paragraph = [0,0,0]

var paragraph_data = {
	0: {"texto": "", "requerimiento": 0, "correcta": false},
	1: {"texto": "", "requerimiento": 0, "correcta": false},
	2: {"texto": "", "requerimiento": 0, "correcta": false}
}

var usoIA = 3

# Estados del juego
var action = false
var relojActivo = true
var tiempoFinal = ""
var valorTiempoFinal = 0
var valorTiempoLimite = 0
var musicfast = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
