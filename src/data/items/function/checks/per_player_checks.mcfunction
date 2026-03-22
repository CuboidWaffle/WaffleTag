
# when left click
execute as @s[scores={left_click=1..}]:
    
    # reset left click count
    scoreboard players set @s left_click 0

    #check what item is being used
    execute if predicate items:is_weapon run return:
    
        execute if predicate items:is_gun run return run execute as @s[scores={ammo=1..}]:

                function items:guns/fire_gun with entity @s SelectedItem.components."minecraft:custom_data"

function items:checks/ammo:

    $scoreboard players set @s ammo $(ammo)
    $scoreboard players set @s max_ammo $(max_ammo)
    $scoreboard players set @s reload_amount $(reload_amount)
    $scoreboard players set @s reload_cooldown $(reload_cooldown)
    $scoreboard players set @s reload_cooldown_progress $(reload_cooldown_progress)
    
    #$say $(ammo) ammo
    #$say $(max_ammo) max_ammo
    #$say $(reload_amount) reload_amount
    #$say $(reload_cooldown) reload_cooldown
    #$say $(reload_cooldown_progress) reload_cooldown_progress


    scoreboard players set @s ammo_percent 99
    scoreboard players operation @s ammo_percent *= @s ammo
    scoreboard players operation @s ammo_percent /= @s max_ammo

    #tellraw @s ["",{"text":"%="},{"score":{"name":"@s","objective":"ammo_percent"}}]

    scoreboard players operation @s durability = @s ammo_percent

    # apply durability
    item modify entity @s weapon.mainhand items:set_ammo_display

    # reload ammo if not full and cooldown is over
    execute unless score @s ammo = @s max_ammo run execute as @s[scores={reload_cooldown_progress=..0}]:
        scoreboard players operation @s ammo += @s reload_amount
        execute if score @s ammo > @s max_ammo run scoreboard players operation @s ammo = @s max_ammo
        execute store result storage items:ammo ammo int 1 run scoreboard players get @s ammo
        item modify entity @s weapon.mainhand items:set_ammo

        function items:guns/start_reload_cooldown
    

    execute if score @s ammo < @s max_ammo run execute as @s[scores={reload_cooldown_progress=1..}]:
        scoreboard players remove @s reload_cooldown_progress 1
        execute store result storage items:reload_cooldown_progress reload_cooldown_progress int 1 run scoreboard players get @s reload_cooldown_progress
        item modify entity @s weapon.mainhand items:set_reload_cooldown_progress



function items:guns/start_reload_cooldown:
    execute store result storage items:reload_cooldown_progress reload_cooldown_progress int 1 run scoreboard players get @s reload_cooldown
    item modify entity @s weapon.mainhand items:set_reload_cooldown_progress

execute if predicate items:is_gun run function items:checks/ammo with entity @s SelectedItem.components."minecraft:custom_data"