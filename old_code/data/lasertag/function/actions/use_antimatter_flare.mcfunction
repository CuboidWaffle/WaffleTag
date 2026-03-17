
function lasertag:actions/summon_antimatter_flare_projectile
scoreboard players remove @s projectile_count 1

execute as @s[scores={projectile_count=1..}] run function lasertag:actions/use_antimatter_flare