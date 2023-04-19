extends Control

@onready var tab : TabContainer = $tab


func _ready():
	tab.current_tab = 0
	Global._music_menu()
	$Credits.visible = false

#___________________________________MENU
func _on_play_button_pressed():
	tab.current_tab = 3

func _on_play_button_mouse_entered():
	$tab/TabBar/menu/play/play_button.grab_focus()

func _on_settings_button_pressed():
	tab.current_tab = 1
	print("setting")

func _on_settings_button_mouse_entered():
	$tab/TabBar/menu/play/settings_button.grab_focus()

func _on_quit_menu_button_pressed():
	tab.current_tab = 2
	print("quit")

func _on_quit_button_mouse_entered():
	$tab/TabBar/menu/play/quit_button.grab_focus()

func _on_back_pressed():
	tab.current_tab = 0
	print("back")

func _on_quit_pressed():
	get_tree().quit()

func _on_credits_button_pressed():
	if $Credits.visible == true:
		$Credits.visible = false
	else:
		$Credits.visible = true

func _on_credits_button_mouse_entered():
	$tab/TabBar/menu/play/credits_button.grab_focus()

func _on_close_button_pressed():
	$Credits.visible = false
