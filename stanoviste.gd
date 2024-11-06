extends Area3D

@export var nazev_cinnosti: String = 'Test'
@export var delka: int

@export var Cinnost: Node

func _prichod(telo: Node3D) -> void:
	if telo.is_in_group('hrac'):
		if not telo.is_connected('aktivovat_objekt', _aktivovat_cinnost):
			telo.aktivovat_objekt.connect(_aktivovat_cinnost)


func _aktivovat_cinnost(stav:=true) -> void:
	if not Nastroje.overit_zdroj(Cinnost):
		return
	
	match stav:
		true:
			Cinnost.zacatek(nazev_cinnosti, delka)
		false:
			Cinnost.konec()
		


func _odchod(telo: Node3D) -> void:
	if telo.is_in_group('hrac'):
		_aktivovat_cinnost(false)
		telo.aktivovat_objekt.disconnect(_aktivovat_cinnost)
