extends Control

var Fullscreenvalue
@onready var ResolutionOption = $VideoSettings/MarginContainer/GridContainer/VideoButtons/Resolution/ResolutionOption
var Resolutions:Dictionary = {
	"1920x1080":Vector2(1920,1080),
	"1280x720":Vector2(1280,720),
	"1600x900":Vector2(1600,900),
	"800x600":Vector2(800,600)}
	
func _ready():
	AddResolutions()

func AddResolutions():
	for r in Resolutions:
		ResolutionOption.add_item(r)

func _on_audio_back_pressed():
	$AudioSettings.hide()
	$MainButtons.show()
	$ButtonSfx.play()

func _on_video_settings_pressed():
	$Settings.hide()
	$VideoSettings.show()
	$ButtonSfx.play()

func _on_quit_pressed():
	get_tree().quit()

func _on_audio_settings_pressed():
	$Settings.hide()
	$AudioSettings.show()
	$ButtonSfx.play()

func _on_settings_pressed():
	$MainButtons.hide()
	$Settings.show()
	$ButtonSfx.play()

func _on_settings_back_pressed():
	$Settings.hide()
	$MainButtons.show()
	$ButtonSfx.play()

func _on_video_back_pressed():
	$VideoSettings.hide()
	$Settings.show()
	$ButtonSfx.play()

func _on_master_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value))


func _on_music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(value))


func _on_sfx_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sfx"), linear_to_db(value))

func _on_fullscreen_toggled(toggled_on):
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_play_pressed():
	$MainButtons.hide()
	$PlayOptions.show()
	$ButtonSfx.play()


func _on_play_back_pressed():
	$PlayOptions.hide()
	$MainButtons.show()
	$ButtonSfx.play()


func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_resolution_option_item_selected(index):
	if Fullscreenvalue == 1:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		var size = Resolutions.get(ResolutionOption.get_item_text(index))
		get_window().size =Vector2i(size)
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		var size = Resolutions.get(ResolutionOption.get_item_text(index))
		get_window().size =Vector2i(size)
