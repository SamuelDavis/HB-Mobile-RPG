extends Control
class_name Player

export var hp := 100 setget set_hp
export var ap := 100 setget set_ap
export var mp := 100 setget set_mp

onready var _hp_label: Label = $Statistics/Labels/LabelHP
onready var _ap_label: Label = $Statistics/Labels/LabelAP
onready var _mp_label: Label = $Statistics/Labels/LabelMP


func _on_Enemy_attacked(dmg := 5) -> void:
	set_hp(hp - dmg)


func set_hp(value: int) -> void:
	hp = value

	if _hp_label:
		_hp_label.set_template(hp)


func set_ap(value: int) -> void:
	ap = value

	if _ap_label:
		_ap_label.set_template(ap)


func set_mp(value: int) -> void:
	mp = value

	if _mp_label:
		_mp_label.set_template(mp)


func _ready() -> void:
	set_hp(int(rand_range(0, hp)))
	set_ap(int(rand_range(0, ap)))
	set_mp(int(rand_range(0, mp)))
