# when projectile is within both boxes run function
execute positioned ~-0.3 ~ ~-0.3 if entity @e[tag=projectile,dx=1,dy=2,dz=1] run \
execute positioned ~-0.7 ~0.8 ~-0.7 if entity @e[tag=projectile,dx=-1,dy=-2,dz=-1] run \
function lasertag:actions/projectile_player_collision