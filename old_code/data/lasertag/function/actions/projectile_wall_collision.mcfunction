tag @s remove active_projectile

# determine projectile type
execute as @s[tag=laser_blaster_projectile] run function lasertag:actions/laser_blaster_projectile_wall_collision
execute as @s[tag=plasma_cannon_projectile] run function lasertag:actions/plasma_cannon_projectile_wall_collision
execute as @s[tag=antimatter_flare_projectile] run function lasertag:actions/antimatter_flare_projectile_wall_collision

kill @e[tag=projectile_display,limit=1,sort=nearest]
kill @s