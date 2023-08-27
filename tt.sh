#!/bin/bash

# Function to shorten a URL using TinyURL
shorten_url() {
    long_url="$1"
    short_url=$(curl -s "https://tinyurl.com/api-create.php?url=$long_url")
    echo "$short_url"
}

# Function to expand a TinyURL to the original URL
expand_url() {
    short_url="$1"
    long_url=$(curl -sI -o /dev/null -w %{url_effective} "$short_url")
    echo "$long_url"
}

# Main script
echo "1. Shorten URL"
echo "2. Expand TinyURL"
read -p "Select an option (1/2): " option

if [ "$option" == "1" ]; then
    read -p "Enter the URL to shorten: " long_url
    short=$(shorten_url "$long_url")
    echo "Shortened URL: $short"
elif [ "$option" == "2" ]; then
    read -p "Enter the TinyURL to expand: " short_url
    expanded=$(expand_url "$short_url")
    echo "Expanded URL: $expanded"
else
    echo "Invalid option selected."
fi
