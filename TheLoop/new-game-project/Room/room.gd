@tool
extends Node3D
class_name Room

@export var left_room : Room
@export var right_room : Room
@export var enabled : bool = true:
	set(value):
		enabled = value
		if enabled:
			_on_enable_room()
		else:
			_on_disable_room()

func _ready() -> void:
	$Teleporter.left_translation = left_room.position - position
	$Teleporter.right_translation = right_room.position - position

func _on_enable_room():
	$Collisions.process_mode = Node.PROCESS_MODE_ALWAYS
	$Collisions.show()
	$Model.process_mode = Node.PROCESS_MODE_ALWAYS
	$Model.show()
	$Lights.process_mode = Node.PROCESS_MODE_ALWAYS
	$Lights.show()
	$Teleporter.process_mode = Node.PROCESS_MODE_ALWAYS
	$Teleporter.show()

func _on_disable_room():
	$Collisions.set_deferred("process_mode", Node.PROCESS_MODE_DISABLED)
	$Collisions.hide()
	$Model.process_mode = Node.PROCESS_MODE_DISABLED
	$Model.hide()
	$Lights.process_mode = Node.PROCESS_MODE_DISABLED
	$Lights.hide()
	$Teleporter.set_deferred("process_mode", Node.PROCESS_MODE_DISABLED)
	$Teleporter.hide()


func _on_entered_left() -> void:
	left_room._on_enable_room()
	_on_disable_room()


func _on_entered_right() -> void:
	right_room._on_enable_room()
	_on_disable_room()
