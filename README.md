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
NOTE- function burn(uint amount,address _of)external; add this function in IERC20.sol by ```ctrl +click on IERC20.sol in imported openzipline file.
## Getting Started
Prerequisites<br>
Ensure you have access to an Ethereum-compatible development environment like Remix IDE.<br>
Use a test network (e.g., Fuji Testnet) to deploy and test contracts before deploying on the mainnet.<br>
Deployment<br>
Compile Contracts:<br>

Compile all three contracts using Remix IDE or your preferred Solidity compiler.<br>
Deploy Contracts:<br>

Deploy each contract individually, starting with GEMS and GOLD tokens, followed by the Vault contract.<br>
Interact with Contracts:<br>

Use Metamask or other Web3 wallets to interact with deployed contracts.<br>
Players can start gold mining, trade gems, battle, and redeem cards within the Clash of Village game environment.<br>
Usage<br>
Mining Gold:<br>

Players can start gold mining using startGoldMining() and claim mined gold with claimGold().<br>
Trading Gems:<br>

Use tradeGems(uint _noOfCoins) to trade GEMS tokens for in-game benefits.<br>
Battle and Rewards:<br>

Engage in battles using battle() to earn rewards in GOLD tokens.<br>
Redeem Cards:<br>

Redeem cards of varying rarities (rare, super rare, epic, mythic, legendary) using redeemCards(Cards _card).<br>
Transfer Tokens:<br>

Transfer tokens between players using transferGems(address to, uint amount).<br>
Authors<br>
Mayank Sharma
LinkedIn: Mayank Sharma
