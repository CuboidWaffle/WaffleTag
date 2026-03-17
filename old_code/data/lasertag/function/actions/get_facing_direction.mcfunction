# summon the temporary entity (facing direction)
execute as @s at @s anchored feet positioned ^ ^ ^1 run summon minecraft:marker ^ ^ ^ {Tags:["direction"]}

# get the coordinates of the player
execute as @s run execute store result score @s playerX run data get entity @s Pos[0] 100000
execute as @s run execute store result score @s playerY run data get entity @s Pos[1] 100000
execute as @s run execute store result score @s playerZ run data get entity @s Pos[2] 100000

# get marker coordinates
execute store result score @s targetX run data get entity @e[tag=direction,limit=1,sort=nearest] Pos[0] 100000
execute store result score @s targetY run data get entity @e[tag=direction,limit=1,sort=nearest] Pos[1] 100000
execute store result score @s targetZ run data get entity @e[tag=direction,limit=1,sort=nearest] Pos[2] 100000

# calculate difference
scoreboard players operation @s targetX -= @s playerX
scoreboard players operation @s targetY -= @s playerY
scoreboard players operation @s targetZ -= @s playerZ

# remove temporary entity
kill @e[tag=direction]