extends Control





func _on_eazy_pressed():
	get_tree().change_scene_to_file("res://scenes/game_e.tscn")


func _on_normal_pressed():
	get_tree().change_scene_to_file("res://scenes/game_n.tscn")


func _on_hard_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
