extends Node3D

enum State { BASE, TRIGGER_L, TRIGGER_R }


@export var left_translation: Vector3
@export var right_translation: Vector3

@onready var __state: State = State.BASE

signal entered_left
signal entered_right


func _on_tp_i(body: Node3D) -> void:
	if __state == State.TRIGGER_L:
		entered_left.emit()
		body.position += left_translation
		__state = State.BASE
	elif __state == State.TRIGGER_R:
		entered_right.emit()
		body.position += right_translation
		__state = State.BASE


func _on_tp_o(body: Node3D) -> void:
	pass # Replace with function body.


func _on_l_i(body: Node3D) -> void:
	__state = State.TRIGGER_L


func _on_l_o(body: Node3D) -> void:
	pass # Replace with function body.


func _on_r_i(body: Node3D) -> void:
	__state = State.TRIGGER_R


func _on_r_o(body: Node3D) -> void:
	pass # Replace with function body.
