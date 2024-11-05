extends CenterContainer

@onready var Napis := $Label

func vypsat(zprava) -> void:
	Napis.show()
	Napis.text = zprava
