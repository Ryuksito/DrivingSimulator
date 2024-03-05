class_name CollidedNode

var node: CollisionObject3D
var collided_car_position: Vector3
var distance: int
var distance_vector: Vector3 = Vector3(0,0,0)
var alpha: float
var beta: float
var gamma: float
var id: int

func _init(collidedNode:CollisionObject3D, idCollidedNode:int, carPosition:Vector3):
	node = collidedNode
	id = idCollidedNode
	collided_car_position = carPosition

func update_distance(position:Vector3):
	
	distance_vector = distance_vector - (position - collided_car_position)
	distance = calculate_magnitude(distance_vector)
	collided_car_position = position
	

func calculate_distance(position:Vector3, radius_sensor:float):
	var x2 = node.position.x
	var y2 = node.position.y
	var z2 = node.position.z
	var x1 = position.x
	var y1 = position.y
	var z1 = position.z
	var c = calculate_magnitude(node.position-position)
	alpha = rad_to_deg(acos((x2-x1) / c))
	beta = rad_to_deg(acos((y2-y1) / c))
	gamma = rad_to_deg(acos((z2-z1) / c))
	var x = cos(deg_to_rad(alpha)) * radius_sensor
	var y = cos(deg_to_rad(beta))  * radius_sensor
	var z = cos(deg_to_rad(gamma)) * radius_sensor
	distance_vector = Vector3(x,y,z)
	distance = calculate_magnitude(distance_vector)
	collided_car_position = position
	
func calculate_magnitude(position:Vector3) -> float:
	var x = position.x
	var y = position.y
	var z = position.z
	return sqrt((x**2) + (y**2) + (z**2))
	
