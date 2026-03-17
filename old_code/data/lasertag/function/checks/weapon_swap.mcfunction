# Default to 0 (no weapon)
scoreboard players set @s held_weapon 0

# Read weapon_id from held item
execute store result score @s held_weapon run data get entity @s SelectedItem.components."minecraft:custom_data".ammo 1

# Detect change
execute as @s unless score @s held_weapon = @s prev_held_weapon run function lasertag:actions/set_gun_reload_cooldown

# Save current
scoreboard players operation @s prev_held_weapon = @s held_weapon
