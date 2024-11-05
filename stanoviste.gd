extends Area3D

@export var nazev_cinnosti: String = 'Test'

@export var Cinnost: Node

func _prichod(telo: Node3D) -> void:
	if telo.is_in_group('hrac'):
		if not telo.is_connected('aktivovat_objekt', _vypsat_cinnost):
			telo.aktivovat_objekt.connect(_vypsat_cinnost)


func _vypsat_cinnost() -> void:
	Cinnost.vypsat(nazev_cinnosti)


func _odchod(telo: Node3D) -> void:
	if telo.is_in_group('hrac'):
		telo.aktivovat_objekt.disconnect(_vypsat_cinnost)
