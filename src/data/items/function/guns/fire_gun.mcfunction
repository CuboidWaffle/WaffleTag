$say $(gun_type)

#execute store result score * 
#$(projectile_count)

function items:guns/summon_projectile:
    say hi
    scoreboard players remove @s projectile_count 1 
    execute if score @s projectile_count matches 1.. run function items:guns/summon_projectile

scoreboard players set @s projectile_count 4
function items:guns/summon_projectile