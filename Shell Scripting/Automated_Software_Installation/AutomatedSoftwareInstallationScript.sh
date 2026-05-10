#!/bin/bash

packageFile="package.txt"
outputLog="install.log"

# Get package.txt file
if [[ ! -f "$packageFile" ]]; then
    echo "Error : Package file ($packageFile) not found!"
    exit 1
fi

# Check & clear previous log file
> "$outputLog"

# Detect package manager
if command -v apt &>/dev/null; then
    pkgMGR="apt"
    updateCMD="sudo apt update"
    installCMD="sudo apt install -y"
elif command -v yum &>/dev/null; then
    pkgMGR="yum"
    updateCMD="sudo yum makecache"
    installCMD="sudo yum install -y"
elif command -v dnf &>/dev/null; then
    pkgMGR="dnf"
    updateCMD="sudo dnf makecache"
    installCMD="sudo dnf install -y"
else
    echo "Error : No supported package manager found!" | tee -a "$outputLog"
    exit 1
fi

echo "Using package manager : $pkgMGR" | tee -a "$outputLog"
$updateCMD >> "$outputLog" 2>&1

# Install packages
while IFS= read -r package || [[ -n "$package" ]]; do
    if [[ -z "$package" || "$package" =~ ^# ]]; then
        continue
    fi

    echo "Installing - $package" | tee -a "$outputLog"
    if $installCMD "$package" >> "$outputLog" 2>&1; then
        echo "SUCCESS: $package installed." | tee -a "$outputLog"
    else
        echo "FAILED: $package failed to install." | tee -a "$outputLog"
    fi
done < "$packageFile"

echo "Installation process complete. Check $outputLog file for details."
