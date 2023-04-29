extends ColorRect

var dialog = [
Global.level_0, 
Global.level_1, 
Global.level_2, 
Global.level_3, 
Global.level_4, 
Global.level_5
]
@onready var label_dialog = %RichTextLabel

@export var selected_index = 1 # Set the index to 3 (fourth variable in the array)

func _ready():
	self.visible = false
	var selected_dialog = dialog[selected_index] # Select the variable at the selected index
	label_dialog.text = str(selected_dialog)
	label_dialog.visible_characters = 0

func _process(delta):
	if self.is_visible_in_tree():
		timer()

func _on_timer_timeout():
	label_dialog.visible_characters += 1

func timer():
	$Timer.start()
