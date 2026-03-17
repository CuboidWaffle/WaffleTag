
# when left click
execute as @s[scores={left_click=1..}]:
    
    # reset left click count
    scoreboard players set @s left_click 0

    say left click

    execute if predicate items:is_weapon:
        say is weapon
        execute if predicate items:is_gun:
            say is gun
            execute if predicate items:is_laser_blaster:
                say using laser blaster
            execute if predicate items:is_plasma_cannon:
                say using plasma cannon
            execute if predicate items:is_antimatter_flare:
                say using antimatter flare