extends Control

signal transition_finishied

func _process(_delta):
	if Global.transition == true:
		show()
		_transition()
		print("trabs")

func _transition():
	Global.transition = false
	$anim.play("fade")
	await $anim.animation_finished
	$anim.play_backwards("fade")
	emit_signal("transition_finishied")
