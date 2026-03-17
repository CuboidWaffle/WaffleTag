# apply projectile velocity constant or start
execute store result score @s gun_projectile_velX run scoreboard players get @e[tag=gun_user,limit=1,sort=nearest] targetX
execute store result score @s gun_projectile_velY run scoreboard players get @e[tag=gun_user,limit=1,sort=nearest] targetY
execute store result score @s gun_projectile_velZ run scoreboard players get @e[tag=gun_user,limit=1,sort=nearest] targetZ

execute as @s[tag=gravity] run execute store result entity @s Motion[0] double 0.0000001 run scoreboard players get @s gun_projectile_velX
execute as @s[tag=gravity] run execute store result entity @s Motion[1] double 0.0000001 run scoreboard players get @s gun_projectile_velY
execute as @s[tag=gravity] run execute store result entity @s Motion[2] double 0.0000001 run scoreboard players get @s gun_projectile_velZ

# apply projectile info
execute as @s run execute store result score @s gun_projectile_damage run data get entity @e[tag=gun_user,limit=1,sort=nearest] SelectedItem.components."minecraft:custom_data".damage
execute as @s run execute store result score @s projectile_lifetime run data get entity @e[tag=gun_user,limit=1,sort=nearest] SelectedItem.components."minecraft:custom_data".projectile_lifetime


tag @s remove new_projectile