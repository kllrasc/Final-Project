extends Control


func _ready():
	update_time()

func update_time():
	$Time.text = "Time: " + str(Global.time)


func _on_timer_timeout():
	Global.update_time(-1)
	update_time()
