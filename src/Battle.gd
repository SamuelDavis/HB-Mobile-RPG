extends Node

onready var _enemy: Enemy = $UI/Enemy
onready var _message_label: RichTextLabel = $UI/Messages/RichTextLabel
var _messages := 0


func _on_Sword_pressed(dmg := 5) -> void:
	if _enemy:
		_enemy.hp -= dmg


func _on_Enemy_has_died(node: Node) -> void:
	if node == _enemy:
		_add_message("Enemy has died!")
		_enemy = null

	node.queue_free()


func _add_message(text: String) -> void:
	if _message_label:
		_messages += 1
		_message_label.text = "%02d: %s\n%s" % [_messages, text, _message_label.text]


func _on_Enemy_damage_taken(value: int) -> void:
	_add_message("Enemy took %d damage!" % value)


func _on_Enemy_damage_done(value: int) -> void:
	_add_message("Player took %d damage!" % value)
