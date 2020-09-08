extends Label
class_name TemplateLabel

onready var _template := text


func set_template(args) -> void:
	if not args is Array:
		args = [args]
	text = _template % args
