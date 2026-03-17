
scoreboard players remove @s reload_cooldown_counter 1

execute store result storage lasertag:reload_cooldown_counter reload_cooldown_counter int 1 run scoreboard players get @s reload_cooldown_counter
item modify entity @s weapon.mainhand lasertag:set_reload_cooldown_counter