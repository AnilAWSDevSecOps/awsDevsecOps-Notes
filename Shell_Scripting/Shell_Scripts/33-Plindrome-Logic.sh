#!/bin/bash
WORD=$1
WORD_LEN=${#WORD}
REVERSE=''
LENGTH=$(expr $WORD_LEN - 1)
#for ((i = 0; i <= $LENGTH; i++)); do
for ((i = $LENGTH; i >= 0; i--)); do
    REVERSE=${REVERSE}${WORD[@]:$i:1}
done
#echo $REVERSE
if [[ $WORD = $REVERSE ]]; then
    echo "$WORD is a Palindrome"
else
    echo "$WORD is not a Palindrome"
fi
