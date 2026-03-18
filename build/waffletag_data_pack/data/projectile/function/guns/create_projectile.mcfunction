say projectile
function players:get_facing_direction
function projectiles:guns/calculate_projectile_velocity
scoreboard players remove @s projectile_count 1
execute if score @s projectile_count matches 1.. run function items:guns/summon_projectile
