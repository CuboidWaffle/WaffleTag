$scoreboard players set @s ammo $(ammo)
$scoreboard players set @s max_ammo $(max_ammo)
$scoreboard players set @s reload_amount $(reload_amount)
$scoreboard players set @s reload_cooldown $(reload_cooldown)
$scoreboard players set @s reload_cooldown_progress $(reload_cooldown_progress)
scoreboard players set @s ammo_percent 99
scoreboard players operation @s ammo_percent *= @s ammo
scoreboard players operation @s ammo_percent /= @s max_ammo
scoreboard players operation @s durability = @s ammo_percent
item modify entity @s weapon.mainhand items:set_ammo_display
execute unless score @s ammo = @s max_ammo run execute as @s[scores={reload_cooldown_progress=..0}] run function items:checks/ammo/nested_execute_0
execute if score @s ammo < @s max_ammo run execute as @s[scores={reload_cooldown_progress=1..}] run function items:checks/ammo/nested_execute_1
