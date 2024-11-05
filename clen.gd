extends CharacterBody3D

const RYCHLOST_POHYBU: float = 2.0

var zacatek_pohybu: bool

@onready var Hrac: Node3D = get_tree().get_first_node_in_group('hrac')
@onready var navigation_agent: NavigationAgent3D = $NavigationAgent3D

@export var aktivace: bool

func _ready():
	navigation_agent.path_desired_distance = 0.5
	navigation_agent.target_desired_distance = 0.5

	actor_setup.call_deferred()
	#set_physics_process(aktivace)


func actor_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame

	zacatek_pohybu = true
	set_movement_target()


func set_movement_target():
	var movement_target: Vector3 = Hrac.global_position
	navigation_agent.set_target_position(movement_target)
	#print(movement_target)


func _physics_process(_delta):
	 #jednoduchá gravitace při nečinnosti
	velocity = Vector3.DOWN
	if aktivace and zacatek_pohybu:
		velocity = _navigovat_do_cile() *RYCHLOST_POHYBU
	move_and_slide()


func _navigovat_do_cile() -> Vector3:
	set_movement_target()
	var current_agent_position: Vector3 = global_position
	var next_path_position: Vector3 = navigation_agent.get_next_path_position()

	return current_agent_position.direction_to(next_path_position)
