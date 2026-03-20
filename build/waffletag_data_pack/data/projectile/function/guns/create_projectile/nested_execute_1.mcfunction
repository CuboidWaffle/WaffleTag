execute store result score @s projectile_velocity_x run scoreboard players get @e[tag=player, limit=1, sort=nearest] targetX
execute store result score @s projectile_velocity_y run scoreboard players get @e[tag=player, limit=1, sort=nearest] targetY
execute store result score @s projectile_velocity_z run scoreboard players get @e[tag=player, limit=1, sort=nearest] targetZ
execute store result entity @s NoGravity int 1 run scoreboard players get @e[tag=player, limit=1, sort=nearest] projectile_no_gravity
execute if score @e[tag=player, limit=1, sort=nearest] projectile_no_gravity matches 0 run function projectile:guns/create_projectile/nested_execute_0
tag @s remove new_projectile
tag @e[tag=new_projectile_data] remove new_projectile_data
