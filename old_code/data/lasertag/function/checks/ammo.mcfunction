# get ammo
execute store result score @s ammo run data get entity @s SelectedItem.components."minecraft:custom_data".ammo 1
execute store result score @s max_ammo run data get entity @s SelectedItem.components."minecraft:custom_data".max_ammo 1
execute store result score @s reload_amount run data get entity @s SelectedItem.components."minecraft:custom_data".reload_amount 1
execute store result score @s reload_cooldown_counter run data get entity @s SelectedItem.components."minecraft:custom_data".reload_cooldown_counter 1

# ammo_percent = ammo * 100 / max_ammo
scoreboard players set @s ammo_percent 99
scoreboard players operation @s ammo_percent *= @s ammo
scoreboard players operation @s ammo_percent /= @s max_ammo

scoreboard players operation @s durability = @s ammo_percent

# apply durability
item modify entity @s weapon.mainhand lasertag:set_ammo_display

# reload ammo if not full and cooldown is over
execute unless score @s ammo = @s max_ammo run \
execute as @s[scores={reload_cooldown_counter=..0}] run \
function lasertag:actions/reload_ammo

execute if score @s ammo < @s max_ammo run \
execute as @s[scores={reload_cooldown_counter=1..}] run \
function lasertag:actions/reduce_reload_counter