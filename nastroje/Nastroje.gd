class_name Nastroje
extends Node

static func zavolat(zdroj:Node, nazev_funkce:String, argumenty:Array =[]):
	if not overit_zdroj(zdroj):
		return
	
	if zdroj.has_method(nazev_funkce):
		zdroj.callv(nazev_funkce, argumenty)
	else:
		push_warning('{0} nemá metodu {1}'.format([zdroj.name, nazev_funkce]))

static func nastavit(zdroj:Node, nazev_atributu:String, hodnota):
	if not overit_zdroj(zdroj):
		return
	
	if nazev_atributu in zdroj:
		zdroj.set(nazev_atributu, hodnota)
	else:
		push_warning('{0} nemá atribut {1}'.format([zdroj.name, nazev_atributu]))

static func overit_zdroj(zdroj: Node):
	if zdroj:
		return true
	else:
		push_warning('Zdroj není inicializován')
		return false
