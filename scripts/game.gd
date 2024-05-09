extends Control
@onready var QuitPressed = get_node("AnimationPlayer")

func _on_quit_button_pressed():
	$QuitScreen.show()
	QuitPressed.play("QuitPressed")

func _on_menu_quit_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_desktop_quit_pressed():
	get_tree().quit()

func _on_quit_back_pressed():
	$QuitScreen.hide()
