# Demonstrates how hit detection works.
extends Area2D

onready var label := get_node("Label") as Label

var collisions := 0

# Simulate "invinsibility frames", else we would detect collisions each frame a
# hitbox is on top of us.
var detecting := true

func _process(delta: float) -> void:
	label.text = "Collisions: %d" % collisions

func _on_Detector_area_shape_entered(area_id: int, area: Area2D, area_shape: int, self_shape: int) -> void:
	if detecting:
		collisions += 1
		detecting = false
		yield(get_tree().create_timer(0.1), "timeout")
		detecting = true
