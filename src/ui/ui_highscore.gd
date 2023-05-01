extends ColorRect


@onready var current_score = %currenct_score
@onready var best_score    = %best_score
@onready var rank          = %rank

@export var current_level : int  = 0



func _ready():
	Global.load_save()
	var level_highscore = {
	0: Global.lvl_0_highscore,
	1: Global.lvl_1_highscore,
	2: Global.lvl_2_highscore,
	3: Global.lvl_3_highscore,
	4: Global.lvl_4_highscore
}
	current_score.text = str(str(Global.current_score).pad_decimals(1) + "s")
	best_score.text = str(str(level_highscore[current_level]) + "s")
	
