extends Control


func _on_button_play_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
	
func _on_button_options_pressed():
	get_tree().change_scene_to_file("res://Options.tscn")
	
func _on_button_quiz_pressed():
	get_tree().quit()
# Assuming you have a button in the first screen that triggers the transition

