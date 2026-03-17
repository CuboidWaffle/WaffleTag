scoreboard players operation @s ammo += @s reload_amount

execute if score @s ammo > @s max_ammo run scoreboard players operation @s ammo = @s max_ammo

execute store result storage lasertag:ammo ammo int 1 run scoreboard players get @s ammo
item modify entity @s weapon.mainhand lasertag:set_ammo

function lasertag:actions/set_gun_reload_cooldown