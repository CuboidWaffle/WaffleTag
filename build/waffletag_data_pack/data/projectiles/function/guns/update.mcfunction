execute store result entity @s[tag=!gravity] Motion[0] double 0.00001 run scoreboard players get @s projectile_velocity_x
execute store result entity @s[tag=!gravity] Motion[1] double 0.00001 run scoreboard players get @s projectile_velocity_y
execute store result entity @s[tag=!gravity] Motion[2] double 0.00001 run scoreboard players get @s projectile_velocity_z
execute at @s if predicate projectiles:has_hit_entity run function projectiles:guns/collision
execute at @s if predicate projectiles:has_hit_wall run function projectiles:guns/collision
