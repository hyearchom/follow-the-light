extends Control

func zacatek(nazev, delka) -> void:
	show()
	$Nazev.text = nazev
	$Casovac.start()
	$Prubeh.max_value = delka
	$Prubeh.value = delka


func konec() -> void:
	hide()
	$Casovac.stop()


func _zmenit_prubeh() -> void:
	$Prubeh.value -= 1
	if $Prubeh.value == 0:
		konec()
		
