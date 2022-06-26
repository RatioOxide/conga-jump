extends Control




func _ready():
	pass 



func _on_Play_pressed():
	$Fadin/AnimationPlayer
	get_tree().change_scene("res://WorldMain.tscn")
	
	


func _on_Quit_pressed():
	$Fadin/AnimationPlayer
	get_tree().quit()
