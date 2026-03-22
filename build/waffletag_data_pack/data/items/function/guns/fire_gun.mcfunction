$scoreboard players set @s projectile_count $(projectile_count)
$scoreboard players set @s projectile_spread $(projectile_spread)
$scoreboard players set @s projectile_velocity $(projectile_velocity)
$scoreboard players set @s projectile_no_gravity $(projectile_no_gravity)
$scoreboard players set @s ammo $(ammo)
$scoreboard players set @s reload_cooldown $(reload_cooldown)
function projectile:guns/create_projectile
scoreboard players remove @s ammo 1
execute store result storage items:ammo ammo int 1 run scoreboard players get @s ammo
item modify entity @s weapon.mainhand items:set_ammo
function items:guns/start_reload_cooldown
