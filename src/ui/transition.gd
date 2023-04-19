extends CanvasLayer

@onready var progress_bar:ProgressBar = $ProgressBar
var progress = []
var scene_load_status = 0
var scene = Global.next_scene

func _ready():
	ResourceLoader.load_threaded_request(scene)
	$continue.visible = false
	print("Go to %s" %scene)

func _process(delta):
	scene_load_status = ResourceLoader.load_threaded_get_status(scene,progress)
	progress_bar.value = progress[0] * 100
	if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
		$continue.visible = true

func _on_continue_pressed():
	if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
		get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(scene))
		queue_free()
	else:
		print("Scene not loaded or in progress")
