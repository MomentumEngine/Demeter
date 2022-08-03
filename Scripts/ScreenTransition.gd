extends CanvasLayer

onready var anim = get_node("AnimationPlayer")

func change_scene(target_scene:String):
	anim.play("Dissolve")
	yield(anim,"animation_finished") #pauses till animaition has finished
	get_tree().change_scene(target_scene)
	anim.play_backwards("Dissolve")
