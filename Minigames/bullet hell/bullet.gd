extends Area2D

var velocity: Vector2 = Vector2()
var duration = 20


func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")
# yt video code ^^^

func _process(delta: float) -> void:
	position += velocity * delta
	duration -= delta
	if duration <= 0:
		queue_free()
# yt video code ^^^

func _on_body_entered(body):
	if body.is_in_group("players"):
		body.take_damage(1)
		queue_free()
# yt video code ^^^
