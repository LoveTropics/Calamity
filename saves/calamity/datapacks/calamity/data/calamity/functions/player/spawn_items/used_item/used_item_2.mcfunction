# Called from: [advancement] calamity:spawn_items/used_item/used_item_2

tag @s add GiveSelectedStartingItem
scoreboard players set @s selectedItem 102

# Revoke the advancement so the player can get it again
advancement revoke @s only calamity:spawn_items/used_item/used_item_2