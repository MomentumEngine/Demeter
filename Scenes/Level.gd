extends TileMap
class_name InteractiveTilemap

export(Dictionary) var TILE_SCENES := {
	1: preload("res://Scenes/Tile.tscn")
}

onready var half_cell_size := cell_size * 0.5

func _ready():
	yield(get_tree(), "idle_frame")
	_replace_tiles_with_scenes()

func _replace_tiles_with_scenes(scene_dictionary: Dictionary = TILE_SCENES):
	pass
	
func _replace_tile_with_object(tile_pos: Vector2, object_scene: PackedScene, parent: Node = get_tree().current_scene):
	if get_cellv(tile_pos) != INVALID_CELL:
		set_cellv(tile_pos, -1)
		update_bitmask_region()
		
	if object_scene:
		var obj = object_scene.instance()
		var ob_pos = map_to_world(tile_pos) + half_cell_size
		
		parent.add_child(obj)
