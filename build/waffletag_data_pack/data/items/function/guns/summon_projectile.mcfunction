say projectile
scoreboard players remove @s projectile_count 1
execute if score @s projectile_count matches 1.. run function items:guns/summon_projectile
