# reset age and pickup delay to prevent despawn and pickup
data modify entity @s PickupDelay set value 32767

# apply velocity
execute store result entity @s[tag=!gravity] Motion[0] double 0.0000001 run scoreboard players get @s gun_projectile_velX
execute store result entity @s[tag=!gravity] Motion[1] double 0.0000001 run scoreboard players get @s gun_projectile_velY
execute store result entity @s[tag=!gravity] Motion[2] double 0.0000001 run scoreboard players get @s gun_projectile_velZ

scoreboard players remove @s projectile_lifetime 1
