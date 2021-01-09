extends Node2D

onready var bullet_spawner_area = get_node("BulletHellSpawner")
onready var timer := get_node("Timer") as Timer

var boundary_rect: Rect2

var original_vector = Vector2(-1, 0)
var rotation_difference = (2.0 * PI) / 20.0

func _ready() -> void:
	# Here we register the boundary
	boundary_rect = Rect2(
		get_node("TopLeft").position,
		get_node("BottomRight").position - get_node("TopLeft").position
	)
	bullet_spawner_area.set_bounding_box(boundary_rect)

# Spawn a bullet wave with a slightly different rotation
func _on_Timer_timeout() -> void:
	for i in range(0, 20):
		var movement = original_vector.rotated(rotation_difference * i)
		bullet_spawner_area.spawn_bullet(movement)
	original_vector = original_vector.rotated(PI/32.0)

func _on_StartTimer_timeout() -> void:
	timer.start()
