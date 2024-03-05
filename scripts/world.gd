extends Node3D

var cars = []
var carScene = preload("res://scenes/nissan.tscn")
var car: VehicleBody3D
@onready var collitionObj = $StaticBody/MeshInstance3D

# Collitions vars
var collitionsObjs = []	

# Called when the node enters the scene tree for the first time.
func _ready():
	
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	for i in Global.numCars:
		car = carScene.instantiate()
		car.position.x = randi() % 10
		car.position.z = randi() % 10
		car.name = "Car"+str(i)
		cars.append(car)
		add_child(car)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_car()
	
	
#server func
func update_car():
	for c in cars:
		for collision in c.collisions:
			collision.update_distance(c.position)
		for collide:StaticBody3D in c.coll.get_overlapping_bodies():
			var mesh:MeshInstance3D = collide.get_child(0) 
			#print(c.name + ' ' + str(c.get_global_transform().origin - collide.get_global_transform().origin))
		#c.engine_force = 10

		
