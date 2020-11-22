#!/bin/bash

echo "
###################################################################
# __   _______ _____ _____ _   _           _       _              #
# \ \ / /  ___|  ___|_   _| | | |         | |     | |             #
#  \ V /| |__ | |__   | | | | | |_ __   __| | __ _| |_ ___ _ __   #
#   \ / |  __||  __|  | | | | | | '_ \ / _' |/ _  | __/ _ \ '__|  #
#   | | | |___| |___  | | | |_| | |_) | (_| | (_| | ||  __/ |     #
#   \_/ \____/\____/  \_/  \___/| .__/ \__,_|\__,_|\__\___|_|     #
#                             | |                                 #
#                             |_|                                 #
#                                                                 #
# YEETUpdater DreamBot 2 -> DreamBot 3             Version: 1.4   #
###################################################################
"

declare -A refs=(
    ["getGameObjects()"]="GameObjects"
    ["getNpcs()"]="NPCs"
    ["getClient()"]="Client"
    ["getMap()"]="Map"
    ["getGroundItems()"]="GroundItems"
    ["getLocalPlayer()"]="Players.localPlayer()"
    ["getTrade()"]="Trade"
    ["getCamera()"]="Camera"
    ["getClientSettings()"]="ClientSettings"
    ["getQuests()"]="Quests"
    ["getKeyboard()"]="Keyboard"
    ["getWorlds()"]="Worlds"
    ["getWorldHopper()"]="WorldHopper"
    ["getMagic()"]="Magic"
    ["getDepositBox()"]="DepositBox"
    ["getPrayer()"]="Prayers"
    ["getCombat()"]="Combat"
    ["getWidgets()"]="Widgets"
    ["getTabs()"]="Tabs"
    ["getGrandExchange()"]="GrandExchange"
    ["getBank()"]="Bank"
    ["getWalking()"]="Walking"
    ["getDialogues()"]="Dialogues"
    ["getSkills()"]="Skills"
    ["getInventory()"]="Inventory"
    ["getEquipment()"]="Equipment"
    ["getPlayerSettings()"]="PlayerSettings"
    ["getPlayers()"]="Players"
    ["getMouse()"]="Mouse"
    ["getRandomManager()"]="Client.getInstance().getScriptManager().getCurrentScript().getRandomManager()"
)

# Printing the conversions
# for command in "${!refs[@]}"; do echo "$command -> ${refs[$command]}"; done

echo

# Context Swaps
read -p "Scripts context provider (leave blank if none): " context
if [[ $context != "" ]]; then
    echo "  *** INFO *** Replacing Context Dependant Calls."
    for i in $(find -name \*.java);
    do
        for command in "${!refs[@]}";
        do sed -i s/"$context.$command/${refs[$command]}/g" $i;
        done
    done
fi

# Non-Context Dependant Calls
echo "  *** INFO *** Replacing Non-Context Dependant Calls."
for i in $(find -name \*.java);
do
    for command in "${!refs[@]}";
    do sed -i "s/$command/${refs[$command]}/g" $i;
    done
done

echo "Update Complete!  TODO FIX IMPORTS"