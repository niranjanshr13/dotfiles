#!/bin/bash

# Path to menu application
if [[ -n $(command -v rofi) ]]; then
    menu="$(command -v rofi) -dmenu"
elif [[ -n $(command -v dmenu) ]]; then
    menu="$(command -v dmenu)"
else
    echo >&2 "Rofi or dmenu not found"
    exit
fi

answer=$(python3 /home/z/.i3/i3scripts/i3Crypto.py $@)

action=$(echo "close cryptoCompare coinbase capcoin coinMarketCap reddit mew" | sed 's/ /\n/g' | $menu -p "Crypto: $answer")

case $action in
    "close") ;;
	"cryptoCompare") firefox "https://www.cryptocompare.com/coins/$(echo $1 | sed 's/ //g')/overview/USD";;
	"mew") google-chrome-stable "https://www.myetherwallet.com/#send-transaction";;
	"coinMarketCap") firefox "https://coinmarketcap.com";;
	"capcoin") firefox "https://capcoin.io";;
	"coinbase") firefox "https://www.coinbase.com/signin";;
	"reddit") firefox "https://www.reddit.com/r/CryptoCurrency/";;
    *) $0 "$answer $action" ;;
esac
