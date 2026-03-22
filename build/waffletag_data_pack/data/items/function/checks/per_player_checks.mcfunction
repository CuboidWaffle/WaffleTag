execute as @s[scores={left_click=1..}] run function items:checks/per_player_checks/nested_execute_0
execute if predicate items:is_gun run function items:checks/ammo with entity @s SelectedItem.components."minecraft:custom_data"
