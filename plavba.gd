extends Resource

signal posun_lode

var orientace: float = 1 # hodnota pro potřeby testu
var zdvih: float = 1 # hodnota pro potřeby testu
var kormidlo: Vector2i = Vector2i(0,-1)
var vitr: Vector2i = Vector2i(0,-1)

func pohyb_lodi(nazev) -> void:
	if nazev == 'kajuta':
		var presun = vypocet_trasy()
		posun_lode.emit(presun)
		print(presun)
		nove_kolo()


func vypocet_trasy() -> Vector2:
	var smer = kormidlo #nutné zapracovat vítr
	var velikost = orientace *zdvih
	return smer *velikost


func nahodny_vitr() -> Vector2i:
	return Vector2i(randi_range(-1,1), randi_range(-1,1))


func nove_kolo() -> void:
	orientace = 0
	zdvih = 0
	kormidlo = Vector2i(0,-1)
	vitr = nahodny_vitr()
