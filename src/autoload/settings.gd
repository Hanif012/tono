extends Node

# Used for persistent settings
const CONFIG_PATH = "user://settings.ini"

# Used for "temporary" settings such as the last update check timestamp
const CONFIG_CACHE_PATH = "user://cache.ini"

var file := ConfigFile.new()
var cache := ConfigFile.new()


func _ready() -> void:
	# Keep the fullscreen toggle functional while the game is paused
	process_mode = Node.PROCESS_MODE_ALWAYS

	# Loads existing configuration (if any) for use anywhere
	file.load(CONFIG_PATH)
	cache.load(CONFIG_CACHE_PATH)

# Saves configuration files with predefined paths.
# This method should be used over `Settings.file.save(path)`
# unless a custom path needs to be specified.
func save() -> void:
	var file_error := file.save(CONFIG_PATH)
	var cache_error := cache.save(CONFIG_CACHE_PATH)

	if file_error != OK or cache_error != OK:
		push_error("An error occurred while trying to save configuration files.")
