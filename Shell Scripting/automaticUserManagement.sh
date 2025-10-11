#!/bin/bash

USERS=("Raj" "Sahil" "Sanjay" "Ankit")

for user in "${USERS[@]}"; do
    if id "$user" &> /dev/null; then
        echo "User $user already exists"
    else
        sudo useradd -m -s /bin/bash "$user"
        echo "User $user created"
    fi
done

