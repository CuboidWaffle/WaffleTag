function players:get_facing_direction
execute store result score @s randomA run random value -180..180
execute store result score @s randomB run random value -180..180
execute store result score @s randomM run random value -100..100
execute store result score @s math_in run scoreboard players get @s randomA
function math:sin
execute store result score @s randomZ run scoreboard players operation @s math_out *= @s randomM
scoreboard players set @s value 100
scoreboard players operation @s randomZ /= @s value
execute store result score @s math_in run scoreboard players get @s randomA
function math:cos
execute store result score @s randomM2 run scoreboard players operation @s math_out *= @s randomM
scoreboard players set @s value 100
scoreboard players operation @s randomM2 /= @s value
execute store result score @s math_in run scoreboard players get @s randomB
function math:sin
execute store result score @s randomY run scoreboard players operation @s math_out *= @s randomM2
scoreboard players set @s value 100
scoreboard players operation @s randomY /= @s value
execute store result score @s math_in run scoreboard players get @s randomB
function math:cos
execute store result score @s randomX run scoreboard players operation @s math_out *= @s randomM2
scoreboard players set @s value 100
scoreboard players operation @s randomX /= @s value
scoreboard players operation @s randomX *= @s projectile_spread
scoreboard players operation @s randomY *= @s projectile_spread
scoreboard players operation @s randomZ *= @s projectile_spread
scoreboard players operation @s targetX += @s randomX
scoreboard players operation @s targetY += @s randomY
scoreboard players operation @s targetZ += @s randomZ
scoreboard players operation @s targetX *= @s projectile_velocity
scoreboard players operation @s targetY *= @s projectile_velocity
scoreboard players operation @s targetZ *= @s projectile_velocity
execute as @s at @s anchored eyes positioned ^ ^ ^0.5 run summon minecraft:trident ~ ~-0.125 ~ {item: {id: "trident", count: 1b, components: {enchantments: {"projectiles:no_damage": 1, loyalty: 3}}}, Silent: 1b, OnGround: 0b, Invulnerable: 1b, damage: 0.0d, PierceLevel: -1b, pickup: 0b, Tags: ["projectile", "new_projectile"], HasBeenShot: 0b, Passengers: [{id: "minecraft:item_display", item: {id: "minecraft:redstone_block", count: 1b, components: {custom_model_data: {strings: ["projectile"]}}}, transformation: {translation: [0.0d, -0.375d, 0.0d], scale: [0.25d, 0.25d, 0.25d], left_rotation: [0.0d, 0.0d, 0.0d, 1.0d], right_rotation: [0.0d, 0.0d, 0.0d, 1.0d]}, Tags: ["projectile_display"]}]}
tag @s add player
execute as @e[tag=new_projectile] run function projectile:guns/create_projectile/nested_execute_1
tag @s remove player
scoreboard players remove @s projectile_count 1
execute if score @s projectile_count matches 1.. run function projectile:guns/create_projectile
