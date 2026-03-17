execute as @a run function lasertag:checks/ammo
execute as @a run function lasertag:checks/gun_use
execute as @a run function lasertag:checks/player_projectile_collision
execute as @a run function lasertag:checks/weapon_swap
execute as @e[tag=projectile] run function lasertag:states/gun_projectiles
execute as @e[tag=projectile] run function lasertag:checks/wall_projectile_collision
execute as @e[tag=projectile] run function lasertag:checks/projectile_lifetime
