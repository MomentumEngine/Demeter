extends Area2D

onready var cursor = get_node("Cursor")
onready var tree_sprite = get_node("TreeSprite")

var tree_placed:bool = false

func _ready():
	pass

func _on_Tile_mouse_entered():
	cursor.visible = true

func _on_Tile_mouse_exited():
	cursor.visible = false

func _on_Tile_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT and tree_sprite.visible == false:
		tree_sprite.visible = true
		tree_placed = true

	elif event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT and tree_sprite.visible == true:
		tree_sprite.visible = false
		tree_placed = false
