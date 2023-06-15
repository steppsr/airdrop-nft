#!/bin/bash

# Data file format:
# xch1mxuzqqte2kgu85he6jv8k52qcpynkfz9na4v69203y54uejgk3rsh6d2yr,nft1dqhcx6pundq0fmjxmc69p2m26m25rczz68yd9sjneg5hh0ut325s6c86dw
#

airdrops=`cat airdrop.csv`
fee_xch="0.000000000001"
fingerprint="your_fingerprint_here"
nft_wallet_id="your_nft_wallet_id"

n=1
for itm in $airdrops
do
	add=`echo $itm | cut -c 1-62`
	nftid=`echo $itm | cut -c 64-`
	echo "$n"

    coin_id=`chia wallet nft get_info -ni $nftid | grep "Current NFT coin ID" | cut -c 28-`
    cmd="~/chia-blockchain/venv/bin/chia wallet nft transfer -f $fingerprint -i $nft_wallet_id -m $fee_xch -ni $coin_id -ta $add"
	echo $cmd
    ~/chia-blockchain/venv/bin/chia wallet nft transfer -f $fingerprint -i $nft_wallet_id -m $fee_xch -ni $coin_id -ta $add

	n=$(($n+1))

	secs=60
    while [ $secs -gt 0 ]; do
       echo -ne " $secs\033[0K\r"
       sleep 1
       : $((secs--))
    done

done
