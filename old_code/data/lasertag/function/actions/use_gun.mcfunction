# define gun user
tag @s add gun_user

# reduce ammo count
function lasertag:actions/use_gun_ammo

# get projectile count
execute store result score @s projectile_count run data get entity @s SelectedItem.components."minecraft:custom_data".projectile_count 1

# determine which gun is being used and call appropriate function
execute as @s at @s if predicate lasertag:is_laser_blaster run function lasertag:actions/use_laser_blaster
execute as @s at @s if predicate lasertag:is_plasma_cannon run function lasertag:actions/use_plasma_cannon
execute as @s at @s if predicate lasertag:is_antimatter_flare run function lasertag:actions/use_antimatter_flare

function lasertag:actions/set_gun_reload_cooldown

# remove gun user
tag @s remove gun_user