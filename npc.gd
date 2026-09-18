extends Node2D

var player_near := false
var dialogue_index := 0

var dialogue = [
	"Cześć!",
	"Co robisz w naszej szkole?",
	"Lepiej nie schodź do piwnicy...",
	"Podobno dzieją się tam dziwne rzeczy."
]

@onready var label = $Label

func _ready():
	label.visible = false


func _process(_delta):
	if player_near and Input.is_action_just_pressed("interact"):
		show_next_dialogue()


func show_next_dialogue():
	label.visible = true

	label.text = dialogue[dialogue_index]

	dialogue_index += 1

	if dialogue_index >= dialogue.size():
		dialogue_index = 0

func _on_chat_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_near = true


func _on_chat_detection_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_near = false
		label.visible = false
		dialogue_index = 0
