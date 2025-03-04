extends Camera2D

@export var player : CharacterBody2D

## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#global_position.y = clamp(global_position.y, -200, 430)
	if(player != null):#game goes on when 
		self.global_position = lerp(self.global_position, player.global_position ,0.75)
	#pass
