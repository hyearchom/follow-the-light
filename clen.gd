extends CharacterBody3D

var movement_speed: float = 2.0
var zacatek_pohybu: bool

@onready var Hrac: Node3D = get_tree().get_first_node_in_group('hrac')
@onready var navigation_agent: NavigationAgent3D = $NavigationAgent3D

func _ready():
	# These values need to be adjusted for the actor's speed
	# and the navigation layout.
	navigation_agent.path_desired_distance = 0.5
	navigation_agent.target_desired_distance = 0.5

	# Make sure to not await during _ready.
	actor_setup.call_deferred()

func actor_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame

	# Now that the navigation map is no longer empty, set the movement target.
	zacatek_pohybu = true
	set_movement_target()

func set_movement_target():
	var movement_target: Vector3 = Hrac.global_position
	navigation_agent.set_target_position(movement_target)
	print(movement_target)

func _physics_process(_delta):
	if not zacatek_pohybu:
		return


	var current_agent_position: Vector3 = global_position
	set_movement_target()
	var next_path_position: Vector3 = navigation_agent.get_next_path_position()

	velocity = current_agent_position.direction_to(next_path_position) * movement_speed
	move_and_slide()
