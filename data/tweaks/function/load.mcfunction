#Setup data
data modify storage tweaks:data trades set value [ \
{maxUses:1, sell:{count:1, id:"wither_skeleton_skull"}, buy:{count:1, id:"heavy_core", priceMultiplier:0.05f}}, \
{maxUses:1, sell:{count:1, id:"heart_of_the_sea"}, buy:{count:1, id:"turtle_helmet", priceMultiplier:0.05f}}, \
{maxUses:1, sell:{count:1, id:"dragon_breath"}, buy:{count:1, id:"ominous_trial_key", priceMultiplier:0.05f}}, \
{maxUses:1, sell:{count:1, id:"sniffer_egg"}, buy:{count:1, id:"dried_ghast", priceMultiplier:0.05f}}, \
{maxUses:1, sell:{count:1, id:"conduit"}, buy:{count:1, id:"beacon", priceMultiplier:0.05f}}, \
{maxUses:1, sell:{count:1, id:"axolotl_bucket"}, buy:{count:1, id:"recovery_compass", priceMultiplier:0.05f}}, \
{maxUses:1, sell:{count:1, id:"disc_fragment_5"}, buy:{count:1, id:"ominous_bottle", priceMultiplier:0.05f}}, \
{maxUses:1, sell:{count:1, id:"creaking_heart"}, buy:{count:1, id:"sculk_shrieker", priceMultiplier:0.05f}}, \
{maxUses:1, sell:{count:1, id:"bell"}, buy:{count:1, id:"wolf_armor", priceMultiplier:0.05f}}, \
{maxUses:1, sell:{count:1, id:"heavy_core", priceMultiplier:0.05f}, buy:{count:1, id:"wither_skeleton_skull"}}, \
{maxUses:1, buy:{count:1, id:"heart_of_the_sea", priceMultiplier:0.05f}, sell:{count:1, id:"turtle_helmet"}}, \
{maxUses:1, buy:{count:1, id:"dragon_breath", priceMultiplier:0.05f}, sell:{count:1, id:"ominous_trial_key"}}, \
{maxUses:1, buy:{count:1, id:"sniffer_egg", priceMultiplier:0.05f}, sell:{count:1, id:"dried_ghast"}}, \
{maxUses:1, buy:{count:1, id:"conduit", priceMultiplier:0.05f}, sell:{count:1, id:"beacon"}}, \
{maxUses:1, buy:{count:1, id:"axolotl_bucket", priceMultiplier:0.05f}, sell:{count:1, id:"recovery_compass"}}, \
{maxUses:1, buy:{count:1, id:"disc_fragment_5", priceMultiplier:0.05f}, sell:{count:1, id:"ominous_bottle"}}, \
{maxUses:1, buy:{count:1, id:"creaking_heart", priceMultiplier:0.05f}, sell:{count:1, id:"sculk_shrieker"}}, \
{maxUses:1, buy:{count:1, id:"bell", priceMultiplier:0.05f}, sell:{count:1, id:"wolf_armor"}}, \
]

#Schedule the trader check
function tweaks:trades/update_init

#Store a value
scoreboard objectives add value dummy