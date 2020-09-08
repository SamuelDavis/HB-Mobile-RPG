extends Control
class_name Enemy

signal has_died(node)
signal damage_taken(value)
signal damage_done(value)

export var hp := 0 setget set_hp
onready var _sprite: Sprite = $Sprite
onready var _hp_label: Label = $LabelHP
var dmg_done := 0
var shakes := 0
var prepare := 0
var attack := 0


func _on_Timer_timeout() -> void:
	if shakes > 0:
		var violence := int(rand_range(0, shakes))
		if _sprite.offset.y == 0 and attack <= 0:
			prepare = int(rand_range(0, violence))
			attack = int(rand_range(0, violence))
			dmg_done = attack
		shakes -= 1
		if _sprite.offset.x >= 0:
			violence = -violence
		_sprite.offset.x = violence
		return

	if prepare > 0:
		prepare -= 1
		_sprite.offset.y -= prepare
	elif attack > 0:
		attack -= 1
		_sprite.offset.y += 10
		if attack <= 0:
			emit_signal("damage_done", dmg_done)
	elif _sprite.offset.y > 0:
		_sprite.offset.y = max(0, _sprite.offset.y - 3)


func set_hp(value: int) -> void:
	if shakes or prepare or attack:
		return

	shakes = int(max(1, hp - value))
	hp = value
	emit_signal("damage_taken", shakes)

	if _hp_label:
		_hp_label.set_template(hp)

	if hp <= 0:
		emit_signal("has_died", self)


func _ready() -> void:
	set_hp(int(rand_range(0, 99)))
