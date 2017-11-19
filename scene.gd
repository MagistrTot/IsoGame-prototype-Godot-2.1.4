extends Node2D

var curFloor = 1
var oldFloor = 0
var minFloor = 0
var maxFloor = 2
var change = false

signal changeFloor

var colTileSet = load("res://tiles.tres")
var notColTileSet = load("res://tiles.tres")

var floors = []

func _ready():
	set_fixed_process(true)
	connect("changeFloor", self, "set_floor")
	floors.push_back(get_node("floor0"))
	floors.push_back(get_node("floor1"))
	floors.push_back(get_node("floor2"))
	
	
func _fixed_process(delta):
	if Input.is_action_pressed("ui_page_up"):
		if curFloor < maxFloor and not change:
			change = true
			curFloor += 1
			emit_signal("changeFloor")
			var posPlayer = get_node("player").get_pos()
			posPlayer.y -= 32
			get_node("player").set_pos(posPlayer)
	elif Input.is_action_pressed("ui_page_down"):
		if curFloor > minFloor and not change:
			change = true
			curFloor -= 1
			emit_signal("changeFloor")
			var posPlayer = get_node("player").get_pos()
			posPlayer.y += 32
			get_node("player").set_pos(posPlayer)
	else:
		change = false

func set_floor():
	for i in range(floors.size()):
		if i <= curFloor:
			floors[i].set_opacity(1.0)
		elif i > curFloor:
			floors[i].set_opacity(0.0)
		if i == curFloor:
			floors[i].set_tileset(colTileSet)
		else:
			floors[i].set_tileset(notColTileSet)