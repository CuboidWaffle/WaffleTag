$scoreboard players set @s projectile_spread $(projectile_spread)
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
