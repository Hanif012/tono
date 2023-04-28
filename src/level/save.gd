extends Control

func _ready():
	await get_tree().create_timer(2).timeout 
	Global.save()
	Global.load()
	$AnimationPlayer.play("save")
	await get_tree().create_timer(5).timeout 
	self.visible = false
