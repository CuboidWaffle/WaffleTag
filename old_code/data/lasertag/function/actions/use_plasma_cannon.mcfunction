
function lasertag:actions/summon_plasma_cannon_projectile
scoreboard players remove @s projectile_count 1

execute as @s[scores={projectile_count=1..}] run function lasertag:actions/use_plasma_cannon