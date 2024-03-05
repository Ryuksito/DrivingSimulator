extends VehicleBody3D

const MAX_STEER = 0.80
const ENGINE_POWER = 300
var is_collide:bool = false

# COLLITIONS
var collisions = []
@onready var colision_sensor = $AreaSensor/CollisionSensor

@onready var coll = $AreaSensor

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	steering = move_toward(steering, Input.get_axis("ui_right", "ui_left") * MAX_STEER, delta * 2.5)
	engine_force = Input.get_axis("ui_down", "ui_up") * ENGINE_POWER

func _on_area_3d_body_entered(body):
	var collision = preload("res://scripts/collided_node.gd").new(body, len(collisions), position)
	collision.calculate_distance(position, colision_sensor.shape.radius)
	collisions.append(collision)
	print('collide: ', len(collisions))
	
func _on_area_3d_body_exited(body):
	for collision in collisions:
		if collision.node == body:
			collisions.remove_at(collision.id)
	print('exit collide: ', len(collisions))

func _on_body_entered(body):
	print("choco -1 punto")
