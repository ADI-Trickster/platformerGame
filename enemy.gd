extends StaticBody2D


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body is Player):
		body.hitAudio.play()
		#body.queue_free()
		
		#body.visible = false;
		#await get_tree().create_timer(1.0).timeout
		body.lives -=1;
		body.emit_signal("lives_updated", body.lives)
		body.respawn();
		
		if(body.lives == 0):
			await get_tree().create_timer(0.01).timeout
			body.visible = false;
			body.queue_free();
			
			await get_tree().create_timer(1.0).timeout
			get_tree().change_scene_to_file("res://game_over.tscn");
	
	#pass # Replace with function body.
	
func after_player_died():
	pass
