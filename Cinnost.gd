extends Control

signal cinnost_splnena

var nazev: StringName

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
		cinnost_splnena.emit(nazev)
		konec()
