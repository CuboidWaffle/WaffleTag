scoreboard players operation @s ammo += @s reload_amount
execute if score @s ammo > @s max_ammo run scoreboard players operation @s ammo = @s max_ammo
execute store result storage items:ammo ammo int 1 run scoreboard players get @s ammo
item modify entity @s weapon.mainhand items:set_ammo
function items:guns/start_reload_cooldown
