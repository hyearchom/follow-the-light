extends Control

signal cinnost_splnena
@export var PLAVBA: Resource

var nazev: StringName

func _ready() -> void:
	cinnost_splnena.connect(PLAVBA.pohyb_lodi)


func zacatek(oznaceni, delka) -> void:
	show()
	nazev = oznaceni
	$Nazev.text = oznaceni
	$Casovac.start()
	$Prubeh.max_value = delka
	$Prubeh.value = delka


func konec() -> void:
	hide()
	$Casovac.stop()


func _zmenit_prubeh() -> void:
	$Prubeh.value -= 1
	if $Prubeh.value == 0:
		if nazev in PLAVBA:
			PLAVBA.set(nazev, 1)
		cinnost_splnena.emit(nazev)
		konec()
