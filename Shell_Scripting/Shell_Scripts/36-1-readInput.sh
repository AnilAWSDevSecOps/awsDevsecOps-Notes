#!/usr/bin/env bash

read -sp "Enter your password : " pswd

echo -e "\nYour password is $pswd"

read -p "Enter name age and country : " name age country

echo "Name : $name"
echo "Age : $age"
echo "Country : $country"
