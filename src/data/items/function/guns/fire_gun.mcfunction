$say $(gun_type)

#execute store result score * 
#$(projectile_count)

function projectile:guns/create_projectile:
    
    say projectile
    function players:get_facing_direction
    function projectiles:guns/calculate_projectile_velocity
    

    # loop
    scoreboard players remove @s projectile_count 1 
    execute if score @s projectile_count matches 1.. run function items:guns/summon_projectile

function projectiles:guns/calculate_projectile_velocity:
    $scoreboard players set @s projectile_spread $(projectile_spread)

    execute store result score @s randomA run random value -180..180
    execute store result score @s randomB run random value -180..180
    execute store result score @s randomM run random value -100..100
    

$scoreboard players set @s projectile_count $(projectile_count)
function items:guns/create_projectile