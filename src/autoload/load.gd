extends Node

@onready var loading_scene = preload("res://src/ui/transition.tscn")

func load_scene(current_scene, next_scene):
	# add loading scene to the root
	var loading_scene_instance = loading_scene.instantiate()
	get_tree().get_root().call_deferred("add_child",loading_scene_instance)
	
	# find the targeted scene
	var loader = ResourceLoader.load(next_scene)
	
	#check for errors
	if loader == null:
		# handle your error
		print("error occured while getting the scene")
		return

	current_scene.queue_free()
	# creating a little delay, that lets the loading screen to appear.
	await get_tree().create_timer(10).timeout

	# loading the next_scene using poll() function
	# since poll() function loads data in chunks thus we need to put that in loop
	while true:
		var error = loader.poll()
		# when we get a chunk of data
		if error == OK:
			# update the progress bar according to amount of data loaded
			var progress_bar = loading_scene_instance.get_node("ProgressBar")
			progress_bar.value = float(loader.get_stage())/loader.get_stage_count() * 100
		# when all the data have been loaded
		elif error == ERR_FILE_EOF:
			# creating scene instance from loaded data
			var scene = loader.get_resource().instance()
			# adding scene to the root
			get_tree().get_root().call_deferred("add_child",scene)
			# removing loading scene
			loading_scene_instance.queue_free()
			return
		else:
			# handle your error
			print('error occurred while loading chunks of data')
			return

		await get_tree().create_timer(10).timeout
