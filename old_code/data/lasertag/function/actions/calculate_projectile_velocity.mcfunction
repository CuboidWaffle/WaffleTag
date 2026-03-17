# add projectile velocity randomness
execute store result score @s projectile_spread run data get entity @s SelectedItem.components."minecraft:custom_data".projectile_spread 100

execute store result score @s randomX run random value -100..100
execute store result score @s randomY run random value -100..100
execute store result score @s randomZ run random value -100..100

scoreboard players operation @s randomX *= @s projectile_spread
scoreboard players operation @s randomY *= @s projectile_spread
scoreboard players operation @s randomZ *= @s projectile_spread

scoreboard players operation @s targetX += @s randomX
scoreboard players operation @s targetY += @s randomY
scoreboard players operation @s targetZ += @s randomZ

# set projectile velocity base
execute store result score @s projectile_velocity run data get entity @s SelectedItem.components."minecraft:custom_data".projectile_velocity 100

scoreboard players operation @s targetX *= @s projectile_velocity
scoreboard players operation @s targetY *= @s projectile_velocity
scoreboard players operation @s targetZ *= @s projectile_velocity