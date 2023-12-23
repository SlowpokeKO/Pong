extends Control



func _on_back_button_pressed():
	self.visible = false
	get_parent_control().get_node("MainMenu").visible = true
	#get_tree().get_node("MainMenu").visible = true
