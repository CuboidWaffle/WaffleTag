
# when left click
execute as @s[scores={left_click=1..}]:
    
    # reset left click count
    scoreboard players set @s left_click 0

    #check what item is being used
    execute if predicate items:is_weapon run return:
    
        execute if predicate items:is_gun run return:

                function items:guns/fire_gun with entity @s SelectedItem
