# airdrop-nft

Bash script to airdrop NFTs. Source file has an NFT ID and Wallet Address on each line in CSV format.

You should edit the top of the script to set the values for your setup:
- airdrops: this should contain the path & filename for the source file for the airdrop. The format should be Wallet Address a comma then the NFT ID to send. One record per line.
- fee_xch: this is the fee amount in XCH to pay for each transaction.
- fingerprint: this is the fingerprint of your wallet.
- nft_wallet_id: this is the wallet_id that contains the NFT(s) you want to send.
- seconds: this is the amount of time to wait between each transaction.

This sends the NFTs one-at-time and not in bulk.

## Running the script
```Bash
bash airdrop.sh
```

