scoreboard players remove @s reload_cooldown_progress 1
execute store result storage items:reload_cooldown_progress reload_cooldown_progress int 1 run scoreboard players get @s reload_cooldown_progress
item modify entity @s weapon.mainhand items:set_reload_cooldown_progress
