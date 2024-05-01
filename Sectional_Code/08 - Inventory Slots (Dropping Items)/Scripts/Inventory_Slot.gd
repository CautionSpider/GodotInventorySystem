## Inventory_Slot.gd

# Scene-Tree Node references
@onready var icon = $InnerBorder/ItemIcon
@onready var quantity_label =  $InnerBorder/ItemQuantity
@onready var details_panel = $DetailsPanel
@onready var item_name = $DetailsPanel/ItemName
@onready var item_type = $DetailsPanel/ItemType
@onready var item_effect = $DetailsPanel/ItemEffect
@onready var usage_panel = $UsagePanel

# Slot Item
var item = null

# Based on your video, which worked, this would be func _on_item_button_pressed():
# Show usage panel for player to use/remove item
func _on_button_pressed():
	if item != null:
		usage_panel.visible = !usage_panel.visible

# Based on your video, which worked, this would be func _on_item_button_mouse_entered():
# Show item details on hover enter
func _on_button_mouse_entered():
	if item != null:
		usage_panel.visible = false
		details_panel.visible = true

# Hide item details on hover exit
# Based on your video, which worked, this would be func _on_item_button_mouse_exited():
func _on_button_mouse_exited():
	details_panel.visible = false

# Remove item from inventory and drop it back into the world		
func _on_drop_button_pressed():
	if item != null:
		var drop_position = Global.player_node.global_position
		var drop_offset = Vector2(50, 0)
		drop_offset = drop_offset.rotated(Global.player_node.rotation)
		Global.drop_item(item, drop_position + drop_offset)
		Global.remove_item(item["type"], item["effect"])
		usage_panel.visible = false
		
# Default empty slot
func set_empty():
	icon.texture = null  
	quantity_label.text = ""
	
# Set slot item with its values from the dictionary
func set_item(new_item):
	item = new_item
	icon.texture = item["texture"] 
	quantity_label.text = str(item["quantity"])
	item_name.text = str(item["name"])
	item_type.text = str(item["type"])
	if item["effect"] != "":
		item_effect.text = str("+ ", item["effect"])
	else: 
		item_effect.text = ""
