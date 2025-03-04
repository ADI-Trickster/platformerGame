extends CanvasLayer

#@onready var label := $CenterContainer/MarginContainer/VBoxContainer/Label
var label : Label

## Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label = $CenterContainer/MarginContainer/VBoxContainer/Label
	set_lives_text(5)
	#pass # Replace with function body.

func set_lives_text(lives: int):
	#while label == null:
	print(lives)
	label.text = " Lives: "+ str(lives);

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass


func _on_player_lives_updated(Currntlives: int) -> void:
	pass # Replace with function body.
