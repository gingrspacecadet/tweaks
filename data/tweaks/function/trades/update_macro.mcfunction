#Add the trade
$data modify entity @s Offers.Recipes append from storage tweaks:temp trade_list[$(random_index)]

#Remove the trade from the temporary list
$data remove storage tweaks:temp trade_list[$(random_index)]


