extends Area2D

onready var normal_tile_sprite = get_node("NormalSprite")
onready var half_burnt_tile_sprite = get_node("HalfBurntSprite")
onready var full_burnt_tile_sprite = get_node("FullBurntSprite")

onready var cursor = get_node("Cursor")
onready var tree_sprite = get_node("TreeSprite")

onready var half_burnt_timer = get_node("HalfBurntTimer")
onready var full_burnt_timer = get_node("FullBurntTimer")

var tree_placed:bool
var is_halfburnt:bool
var is_fullburnt:bool

var wait_time_before_burn:int = 5

func _ready(): #Called when node enters the scene for the first time
	tree_placed = false
	is_halfburnt = false
	is_fullburnt = false
	
	half_burnt_timer.set_wait_time(wait_time_before_burn)
	full_burnt_timer.set_wait_time(wait_time_before_burn)


func _process(delta): #Called once every 60 seconds
	pass

func _on_Tile_mouse_entered():
	cursor.visible = true

func _on_Tile_mouse_exited():
	cursor.visible = false

func _on_Tile_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT and tree_sprite.visible == false and is_halfburnt == false and is_fullburnt == false:
		tree_sprite.visible = true
		tree_placed = true

	elif event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_RIGHT and tree_sprite.visible == true:
		tree_sprite.visible = false
		tree_placed = false
		half_burnt_timer.start()

func _on_Timer_timeout():
	normal_tile_sprite.visible = false
	half_burnt_tile_sprite.visible = true
	is_halfburnt = true
	is_fullburnt = false
	tree_placed = false
	
	full_burnt_timer.start()

func _on_FullBurntTimer_timeout():
	half_burnt_tile_sprite.visible = false
	full_burnt_tile_sprite.visible = true
	is_halfburnt = false
	is_fullburnt = true
	tree_placed = false
