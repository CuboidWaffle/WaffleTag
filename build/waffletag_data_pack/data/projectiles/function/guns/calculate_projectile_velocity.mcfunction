$scoreboard players set @s projectile_spread $(projectile_spread)
$scoreboard players set @s projectile_velocity $(projectile_velocity)
execute store result score @s randomA run random value -180..180
execute store result score @s randomB run random value -180..180
execute store result score @s randomM run random value -100..100
execute store result score @s math_in run scoreboard players get @s randomA
function math:sin
execute store result score @s randomZ run scoreboard players operation @s math_out *= @s randomM
execute store result score @s math_in run scoreboard players get @s randomA
function math:cos
execute store result score @s randomM2 run scoreboard players operation @s math_out *= @s randomM
execute store result score @s math_in run scoreboard players get @s randomB
function math:sin
execute store result score @s randomY run scoreboard players operation @s math_out *= @s randomM2
execute store result score @s math_in run scoreboard players get @s randomB
function math:cos
execute store result score @s randomX run scoreboard players operation @s math_out *= @s randomM2
tellraw @s ["", {text: "X="}, {score: {name: "@s", objective: "randomX"}}]
scoreboard players operation @s randomX *= @s projectile_spread
scoreboard players operation @s randomY *= @s projectile_spread
scoreboard players operation @s randomZ *= @s projectile_spread
scoreboard players operation @s targetX += @s randomX
scoreboard players operation @s targetY += @s randomY
scoreboard players operation @s targetZ += @s randomZ
scoreboard players operation @s targetX *= @s projectile_velocity
scoreboard players operation @s targetY *= @s projectile_velocity
scoreboard players operation @s targetZ *= @s projectile_velocity
