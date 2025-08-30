#!/bin/bash

# Get user list
USER_LIST="user_list.txt"
CREDENTIALS_FILE="credentials.txt"

# Empty credentials file before writing
> "$CREDENTIALS_FILE"

while IFS= read -r username; do
    # Skip empty lines
    [ -z "$username" ] && continue

    if id "$username" &>/dev/null; then
        echo "User $username already exists. Skipping..."
    else
        PASSWORD=$(openssl rand -base64 12)
        useradd -m -s /bin/bash "$username"
        echo "$username:$PASSWORD" | chpasswd
        echo "$username:$PASSWORD" >> "$CREDENTIALS_FILE"
        echo "User $username created."
    fi
done < "$USER_LIST"

echo "All credentials saved to $CREDENTIALS_FILE"
