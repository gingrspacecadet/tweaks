# Chicken feather drop
execute as @a at @a run execute as @e[type=chicken, distance=..32, predicate=tweaks:feather_drop] at @s run summon item ~ ~ ~ {Item:{id:"feather",count:1b}}

# Bat become snail
execute as @e[type=bat,tag=!snail] at @s run tag @s add snail
execute as @e[tag=snail] at @s run data merge entity @s {NoGravity:1b,Motion:[0.0,0.0,0.0]}
execute as @e[tag=snail] at @s if block ^0.5 ^ ^ minecraft:air run data merge entity @s {Motion:[0.0,-1.0,0.0]}