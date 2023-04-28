extends CanvasLayer

@onready var progress_bar:ProgressBar = $ProgressBar

var progress                 = []
var scene_load_status        = 0
var scene                    = Global.next_scene

func _ready():
	ResourceLoader.load_threaded_request(scene)
	print("Go to  %s (transition)" %scene)
	$Label.visible = false
	$Label2.visible = true
	$Label3.set_text("Level 1 Highscore: %f", Global.lvl_1_highscore)
	

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
