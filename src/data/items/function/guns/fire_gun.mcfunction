# pull data used for summoning projectile
$scoreboard players set @s projectile_count $(projectile_count)
$scoreboard players set @s projectile_spread $(projectile_spread)
$scoreboard players set @s projectile_velocity $(projectile_velocity)
$scoreboard players set @s projectile_no_gravity $(projectile_no_gravity)

# pull data that gets stored in the projectile

function projectile:guns/create_projectile:
    
    function players:get_facing_direction

    execute store result score @s randomA run random value -180..180
    execute store result score @s randomB run random value -180..180
    execute store result score @s randomM run random value -100..100

    # calculate z
    execute store result score @s math_in run scoreboard players get @s randomA
    function math:sin
    execute store result score @s randomZ run scoreboard players operation @s math_out *= @s randomM
    scoreboard players set @s value 100
    scoreboard players operation @s randomZ /= @s value

    # calculate M2
    execute store result score @s math_in run scoreboard players get @s randomA
    function math:cos
    execute store result score @s randomM2 run scoreboard players operation @s math_out *= @s randomM
    scoreboard players set @s value 100
    scoreboard players operation @s randomM2 /= @s value

    # calculate y
    execute store result score @s math_in run scoreboard players get @s randomB
    function math:sin
    execute store result score @s randomY run scoreboard players operation @s math_out *= @s randomM2
    scoreboard players set @s value 100
    scoreboard players operation @s randomY /= @s value

    # calculate X
    execute store result score @s math_in run scoreboard players get @s randomB
    function math:cos
    execute store result score @s randomX run scoreboard players operation @s math_out *= @s randomM2
    scoreboard players set @s value 100
    scoreboard players operation @s randomX /= @s value


    scoreboard players operation @s randomX *= @s projectile_spread
    scoreboard players operation @s randomY *= @s projectile_spread
    scoreboard players operation @s randomZ *= @s projectile_spread

    scoreboard players operation @s targetX += @s randomX
    scoreboard players operation @s targetY += @s randomY
    scoreboard players operation @s targetZ += @s randomZ

    scoreboard players operation @s targetX *= @s projectile_velocity
    scoreboard players operation @s targetY *= @s projectile_velocity
    scoreboard players operation @s targetZ *= @s projectile_velocity

    #tellraw @s ["",{"text":"tX="},{"score":{"name":"@s","objective":"targetX"}}]
    #tellraw @s ["",{"text":"tY="},{"score":{"name":"@s","objective":"targetY"}}]
    #tellraw @s ["",{"text":"tZ="},{"score":{"name":"@s","objective":"targetZ"}}]
    
    execute as @s at @s anchored eyes positioned ^ ^ ^0.5 run \
        summon minecraft:trident ~ ~-0.125 ~ {\
            item:{\
                id:"trident",\
                count: 1b,\
                },\
            Silent:1b,\
            OnGround:0b,\
            Invulnerable:1b,\
            damage:0d,\
            PierceLevel:-1b,\
            pickup:0b,\
            Tags:["projectile","new_projectile"],\
            HasBeenShot:0b,\
            Passengers:[\
                {\
                    id:"minecraft:item_display",\
                    item:{id:"minecraft:redstone_block",count:1b,components:{custom_model_data:{strings:["projectile"]}}},\
                    transformation:{translation:[0.0, -0.375, 0.0], scale:[0.25, 0.25, 0.25], left_rotation:[0.0, 0.0, 0.0, 1.0], right_rotation:[0.0, 0.0, 0.0, 1.0]},\
                    Tags:["projectile_display"]\
                }\
            ]\
        }

    tag @s add player
    execute as @e[tag=new_projectile]:

        # store velocity as score
        execute store result score @s projectile_velocity_x run scoreboard players get @e[tag=player,limit=1,sort=nearest] targetX
        execute store result score @s projectile_velocity_y run scoreboard players get @e[tag=player,limit=1,sort=nearest] targetY
        execute store result score @s projectile_velocity_z run scoreboard players get @e[tag=player,limit=1,sort=nearest] targetZ

        # apply velocity once instead of constantly apply
        execute store result entity @s NoGravity int 1 run scoreboard players get @e[tag=player,limit=1,sort=nearest] projectile_no_gravity
        execute if score @e[tag=player,limit=1,sort=nearest] projectile_no_gravity matches 0:
            tag @s add gravity
            execute store result entity @s Motion[0] double 0.00001 run scoreboard players get @s projectile_velocity_x
            execute store result entity @s Motion[1] double 0.00001 run scoreboard players get @s projectile_velocity_y
            execute store result entity @s Motion[2] double 0.00001 run scoreboard players get @s projectile_velocity_z
        tag @s remove new_projectile
    tag @s remove player
    

    # loop
    scoreboard players remove @s projectile_count 1 
    execute if score @s projectile_count matches 1.. run function projectile:guns/create_projectile


function projectile:guns/create_projectile