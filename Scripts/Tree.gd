extends Area2D

export(Texture) var sprite # Sprite Texture for each Tree Instance

func _ready():
	$Sprite.texture = sprite
