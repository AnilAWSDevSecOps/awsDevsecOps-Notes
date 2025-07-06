#!/bin/bash
# This script will fetch all the pokemon user names from the pokeapi.co
all_pokeusers=$(curl -sL https://pokeapi.co/api/v2/pokemon?limit=1400 | jq ".results[].name" -r)
for pokeuser in $all_pokeusers; do
    echo "poke-user-name is : $pokeuser"
    sleep 1
done
