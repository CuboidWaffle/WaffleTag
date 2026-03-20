tag @s add gravity
say has gravity
execute store result entity @s Motion[0] double 0.00001 run scoreboard players get @s projectile_velocity_x
execute store result entity @s Motion[1] double 0.00001 run scoreboard players get @s projectile_velocity_y
execute store result entity @s Motion[2] double 0.00001 run scoreboard players get @s projectile_velocity_z
