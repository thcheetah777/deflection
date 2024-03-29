class_name UpgradeButton extends Button2D

var label: Label
var icon: Sprite2D
var upgrade: UpgradeObject

@export var icon_spin_speed = 50.0

func _process(delta: float) -> void:
	icon.rotation_degrees += icon_spin_speed * delta

func set_values(upgrade_object: UpgradeObject):
	label = $Card/Label
	icon = $Card/Icon

	upgrade = upgrade_object
	name = upgrade_object.name
	label.text = upgrade_object.name
	icon.texture = upgrade_object.icon

func _on_clicked() -> void:
	UpgradeManager.buy_upgrade(upgrade)
