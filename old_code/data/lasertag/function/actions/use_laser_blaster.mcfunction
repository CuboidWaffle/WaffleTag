function lasertag:actions/summon_laser_blaster_projectile
scoreboard players remove @s projectile_count 1

execute as @s[scores={projectile_count=1..}] run function lasertag:actions/use_laser_blaster