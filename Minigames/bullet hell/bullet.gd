extends Area2D

var velocity: Vector2 = Vector2()
var duration = 20


func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")


func _process(delta):
	pass


func _on_body_entered(body):
	pass 
