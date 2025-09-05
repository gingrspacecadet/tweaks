#Process unchecked traders
execute as @e[type=minecraft:wandering_trader, tag=!checked] run function tweaks:trades/update_amount

#Schedule this function to run again
schedule function tweaks:trades/update_init 1s

