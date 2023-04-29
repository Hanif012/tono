extends CanvasLayer

@onready var progress_bar:ProgressBar = $ProgressBar

var progress                 = []
var scene_load_status        = 0
var scene                    = Global.next_scene

func _ready():
	var random_tip = Global.tips[randi() % Global.tips.size()]
	ResourceLoader.load_threaded_request(scene)
	print("Go to  %s (transition)" %scene)
	$Label.visible = false
	$Label2.visible = true
	%Label3.text = str(random_tip)

func _process(delta):
	scene_load_status = ResourceLoader.load_threaded_get_status(scene,progress)
	progress_bar.value = progress[0] * 100
	if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED :
		$Label.visible = true
		$Label2.visible = false

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("skip"):
			print("transition to %s confirmed(transition)" %scene)
			if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
				get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(scene))
				queue_free()
			else:
				print("Scene not loaded or in progress")
	if event is InputEventMouseButton:
		if event.is_action_pressed("click"):
			print("mouse klik")
			var random_tip = Global.tips[randi() % Global.tips.size()]
			%Label3.text = str(random_tip)
