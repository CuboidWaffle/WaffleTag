
# when left click
execute as @s[scores={left_click=1..}]:
    
    # reset left click count
    scoreboard players set @s left_click 0

    execute if predicate items:is_weapon:
        execute if predicate items:is_gun run return:
            execute if predicate items:is_laser_blaster run return:
                say using laser blaster
            execute if predicate items:is_plasma_cannon run return:
                say using plasma cannon
            execute if predicate items:is_antimatter_flare run return:
                say using antimatter flare