scoreboard players set @s left_click 0
execute if predicate items:is_weapon run return run execute if predicate items:is_gun run return run function items:guns/fire_gun with entity @s SelectedItem.components."minecraft:custom_data"
