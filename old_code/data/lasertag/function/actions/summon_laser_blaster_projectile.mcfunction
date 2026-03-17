# get player facing direction
function lasertag:actions/get_facing_direction

# summon projectile at player
execute anchored eyes positioned ^ ^ ^0.5 run \
    summon minecraft:item ~ ~-0.125 ~ {\
        NoGravity:1b,\
        Invulnerable:1b,\
        Age:-32768,\
        Tags:["projectile","new_projectile","laser_blaster_projectile","active_projectile"],\
        Item:{id:"minecraft:diamond",count:1b,components:{item_model:air}},\
        Passengers:[\
            {\
                id:"minecraft:item_display",\
                item:{id:"minecraft:redstone_block",count:1b,components:{custom_model_data:{strings:["projectile"]}}},\
                transformation:{translation:[0.0, -0.125, 0.0], scale:[0.25, 0.25, 0.25], left_rotation:[0.0, 0.0, 0.0, 1.0], right_rotation:[0.0, 0.0, 0.0, 1.0]},\
                Tags:["projectile_display"]\
            }\
        ]\
    }

# calculate velocity
function lasertag:actions/calculate_projectile_velocity

# apply projectile data
execute as @e[tag=new_projectile] run function lasertag:actions/apply_new_projectile_data