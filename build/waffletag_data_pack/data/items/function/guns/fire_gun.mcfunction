$say $(gun_type)
$scoreboard players set @s projectile_count $(projectile_count)
$scoreboard players set @s projectile_spread $(projectile_spread)
$scoreboard players set @s projectile_velocity $(projectile_velocity)
$scoreboard players set @s projectile_no_gravity $(projectile_no_gravity)
tellraw @s ["", {text: "G="}, {score: {name: "@s", objective: "projectile_no_gravity"}}]
function projectile:guns/create_projectile
