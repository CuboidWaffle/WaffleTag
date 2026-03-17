# deduct ammo
execute store result score @s ammo run data get entity @s SelectedItem.components."minecraft:custom_data".ammo
scoreboard players remove @s ammo 1
execute store result storage lasertag:ammo ammo int 1 run scoreboard players get @s ammo
item modify entity @s weapon.mainhand lasertag:set_ammo
