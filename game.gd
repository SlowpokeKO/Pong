extends Control



func _on_how_to_play_button_pressed():
	$MainMenu.visible = false
	$HowToPlay.visible = true


func _on_start_button_pressed():
	if not $MainMenu/PlayToLineEdit.text == "":
		Main.playTo = int($MainMenu/PlayToLineEdit.text)
	
	get_tree().change_scene_to_file("res://play.tscn")


func _on_play_to_line_edit_text_changed(new_text):
	$MainMenu/PlayToLineEdit.text = str(float($MainMenu/PlayToLineEdit.text))
	$MainMenu/PlayToLineEdit.caret_column = len($MainMenu/PlayToLineEdit.text)
