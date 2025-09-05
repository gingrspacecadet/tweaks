#How many items should be added
execute store result score #trade_amount value run random value 3..6

#Make a copy of the trades data
data remove storage tweaks:temp trade_list
data modify storage tweaks:temp trade_list set from storage tweaks:data trades

#Tag the trader
tag @s add checked
data modify entity @s Offers.Recipes set value []

#Store the max index
execute store result storage tweaks:temp trades.max_index int -1 if data storage tweaks:temp trade_list[]

#Add the trades
function tweaks:trades/update with storage tweaks:temp trades
