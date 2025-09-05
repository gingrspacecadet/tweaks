#Store the random number
$execute store result storage tweaks:temp trades.random_index int 1 run random value $(max_index)..-1

#Add the trade
function tweaks:trades/update_macro with storage tweaks:temp trades

#Message DEBUG
#tellraw @a {"text":"Trader was poked!"}

#Decrement the counter
scoreboard players remove #trade_amount value 1

#Store the new max index
execute store result storage tweaks:temp trades.max_index int -1 if data storage tweaks:temp trade_list[]

#Loop until all trades are added
execute if score #trade_amount value matches 1.. run function tweaks:trades/update with storage tweaks:temp trades