execute store result entity @s[tag=!gravity] Motion[0] double 0.00001 run scoreboard players get @s projectile_velocity_x
execute store result entity @s[tag=!gravity] Motion[1] double 0.00001 run scoreboard players get @s projectile_velocity_y
execute store result entity @s[tag=!gravity] Motion[2] double 0.00001 run scoreboard players get @s projectile_velocity_z

execute at @s if predicate projectiles:has_hit_entity:

    scoreboard players set @s colision
    function projectiles:on_collision with entity @s Score
execute at @s if predicate projectiles:has_hit_wall run function projectiles:on_collision with entity @s Score

function projectiles:on_collision:
    say hit
    particle dust{color:16711680,scale:1} ~ ~ ~ 0 0 0 1 10 normal @a
    execute on passengers run kill @s
    kill @s