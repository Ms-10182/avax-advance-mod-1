Clash of Village Tokens
This Solidity project implements ERC20 tokens for "GEMS" and "GOLD" in the Clash of Village game. Players can mine gold, trade gems, battle, and redeem cards using these tokens.

Contracts Overview
Contract 1: GEMS
Description: ERC20 token contract for GEMS.
Functions:
constructor(): Initializes the token with name "GEM" and symbol "GM", mints 1 billion tokens to the deployer.
burn(uint amount, address _of): Allows burning tokens from _of address.
Contract 2: GOLD
Description: ERC20 token contract for GOLD.
Functions:
constructor(): Initializes the token with name "Gold" and symbol "GLD", mints 1 billion tokens to the deployer.
burn(uint amount, address _of): Allows burning tokens from _of address.
Contract 3: Vault
Description: Manages interactions with GEMS and GOLD tokens for Clash of Village gameplay.
Features:
Gold mining, token balances, and gameplay logic.
Token transfers, gem trading, and card redemption using GEMS tokens.
Interaction with ERC20 tokens via IERC20 interface from OpenZeppelin.
Getting Started
Prerequisites
Ensure you have access to an Ethereum-compatible development environment like Remix IDE or Hardhat.
Use a test network (e.g., Fuji Testnet) to deploy and test contracts before deploying on the mainnet.
Deployment
Compile Contracts:

Compile all three contracts using Remix IDE or your preferred Solidity compiler.
Deploy Contracts:

Deploy each contract individually, starting with GEMS and GOLD tokens, followed by the Vault contract.
Interact with Contracts:

Use Metamask or other Web3 wallets to interact with deployed contracts.
Players can start gold mining, trade gems, battle, and redeem cards within the Clash of Village game environment.
Usage
Mining Gold:

Players can start gold mining using startGoldMining() and claim mined gold with claimGold().
Trading Gems:

Use tradeGems(uint _noOfCoins) to trade GEMS tokens for in-game benefits.
Battle and Rewards:

Engage in battles using battle() to earn rewards in GOLD tokens.
Redeem Cards:

Redeem cards of varying rarities (rare, super rare, epic, mythic, legendary) using redeemCards(Cards _card).
Transfer Tokens:

Transfer tokens between players using transferGems(address to, uint amount).
Authors
Mayank Sharma
LinkedIn: Mayank Sharma
