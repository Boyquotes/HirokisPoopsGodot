extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/Score.text += str(globals.crash_score)
	# If the score is larger than the previous highscore
	$VBoxContainer/HighscoreNotification.visible = true
	$VBoxContainer/Highscore.text += str(globals.crash_score)


func _on_MainMenu_pressed() -> void:
	get_tree().change_scene("res://src/menus/Main.tscn")

func _on_Quit_pressed() -> void:
	if OS.get_name() == "HTML5":
		return
	get_tree().quit()
