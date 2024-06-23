# Clash of Village Tokens
This Solidity project implements ERC20 tokens for "GEMS" and "GOLD" in the Clash of Village game. Players can mine gold, trade gems, transfer gems, battle, and redeem cards using these tokens.

## Contracts Overview

Contract 1: GEMS<br>
Description: ERC20 token contract for GEMS.<br>
Functions:<br>
constructor(): Initializes the token with name "GEM" and symbol "GM", mints 1 billion tokens to the deployer.<br>
burn(uint amount, address _of): Allows burning tokens from _of address. This ```burn()``` will be needed to defined in IERC20 interface in vault.sol.<br><br>

Contract 2: GOLD<br>
Description: ERC20 token contract for GOLD.<br>
Functions:<br>
constructor(): Initializes the token with name "Gold" and symbol "GLD", mints 1 billion tokens to the deployer.<br>
burn(uint amount, address _of): Allows burning tokens from _of address. This ```burn()``` will be needed to defined in IERC20 interface in vault.sol.<br><br>

Contract 3: Vault<br>
Description: Manages interactions with GEMS and GOLD tokens for Clash of Village gameplay.<br>
Features:<br>
Gold mining, token balances, and gameplay logic.<br>
Token transfers, gem trading, gems transfer, and card redemption using GEMS tokens.<br>
Interaction with ERC20 tokens via IERC20 interface from OpenZeppelin.<br><br>
NOTE- add this function in IERC20.sol by ```ctrl +click``` on IERC20.sol in imported openzipline file.
```javascript
function burn(uint amount,address _of)external;
```
This smart contract is deployed on avalanche subnet.

## Getting Started
Prerequisites:<br>
Avalanche subnet deployed and wallet imported in metamask.<br>
Deployment:<br>
Compile and deployment of contracts:<br>
1) Deploy your avalanche subnet.
2) open remix IDE.
3) create new folder ```clash of village```.
4) copy and paste ```GEMS.sol, GOLD.sol, Vault.sol``` into it.<br>
Compile all three contracts and switch to avalance subnet network in metamask.<br>
5) Select Injected metamask and deploy GEMS and GOLD contracts individually then using its address deploy vault contract. deploy all 3 using the same wallet account.
6) copy the address of vault and paste in approve function of GOLD and GEMS and approve desired amount.

## Interaction
Players can start gold mining, trade gems, battle, and redeem cards within the Clash of Village game environment.<br>
<b>Usage:</b><br>
Mining Gold:<br>
Players can start gold mining using ```startGoldMining()``` and claim mined gold with ```claimGold()```. start Mining is 1st and compulsory to get golds.<br>

Trading Gems:<br>
Use ```tradeGems(uint _noOfCoins)``` to trade GEMS tokens for GOLD tokens and collect the gems using ```withdrawGems()```.<br>

Battle and Rewards:<br>
Engage in battles using ```battle()``` to earn rewards in 100 GOLD tokens and battle fee is 20 GOLD token.<br>

Redeem Cards:<br>
Redeem cards of varying rarities (rare, super rare, epic, mythic, legendary) ```using redeemCards(Cards _card)``` and gems will be used to redeem these.<br>

Transfer Tokens:<br>
Transfer tokens between players using ```transferGems(address to, uint amount)```. Before using this user first need to approve the contract for transfer. copy the contract address in gems approve function and enter desired value<br>
Authors<br>
[@Mayank Sharma](https://www.linkedin.com/in/mayank-sharma-078278243/)
