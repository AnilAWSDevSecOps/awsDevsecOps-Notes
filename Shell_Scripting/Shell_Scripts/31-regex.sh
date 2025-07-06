#!/bin/bash
# regex samples
cat ServiceTags_Public_20240909.json | jq ".values[0].properties.addressPrefixes[]" -r | grep -i "^2[0]\|^5[1-2]"

cat ServiceTags_Public_20240909.json | jq ".values[0].properties.addressPrefixes[]" -r | grep -i "^2[0]"

cat ServiceTags_Public_20240909.json | jq ".values[0].properties.addressPrefixes[]" -r | grep -i "^5[1-9]"

cat /etc/passwd | grep -i "^h[a-o]"

cat ServiceTags_Public_20240909.json | jq ".values[0].properties.addressPrefixes[]" -r | grep -i "^2[0]\|^5[1-2]" | head

cat ServiceTags_Public_20240909.json | jq ".values[0].properties.addressPrefixes[]" -r | grep -i "^2[0]\|^5[1-2]" | tail

cat ServiceTags_Public_20240909.json | jq ".values[0].properties.addressPrefixes[]" -r | grep -i "^2[0]"

cat ServiceTags_Public_20240909.json | jq ".values[0].properties.addressPrefixes[]" -r | grep -i "^2[0]" | head

cat ServiceTags_Public_20240909.json | jq ".values[0].properties.addressPrefixes[]" -r | grep -i "^2[0]" | tail
