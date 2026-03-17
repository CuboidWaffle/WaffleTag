execute store result score @s reload_cooldown run data get entity @s SelectedItem.components."minecraft:custom_data".reload_cooldown 1
# --- execute store result score @s reload_cooldown_counter run data get entity @s SelectedItem.components."minecraft:custom_data".reload_cooldown_counter 1

execute store result storage lasertag:reload_cooldown_counter reload_cooldown_counter int 1 run scoreboard players get @s reload_cooldown
item modify entity @s weapon.mainhand lasertag:set_reload_cooldown_counter