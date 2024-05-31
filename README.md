# MODULE 4

## Description:
DegenToken is a Solidity smart contract that creates a simple ERC20 token known as "Degen" (DGN). This currency is intended for usage on a gaming platform, where users can earn, transfer, redeem, and burn tokens for various in-game items and rewards. The contract also offers functions for creating new tokens and verifying token balances.

## Features:
1. **Minting new tokens:** The owner of the contract can create new tokens and distribute them to players as rewards.
2. **Transferring tokens:** Players can transfer their tokens to others.
3. **Redeeming tokens:** Players can redeem their tokens for items available in the in-game store.
4. **Checking token balance:** Players can check their token balance at any time.
5. **Burning tokens:** Anyone can burn tokens they own that are no longer needed.

## Technologies Used:
- Solidity: The programming language used for writing smart contracts on the Ethereum blockchain.
- ERC20: A standard interface for fungible tokens on the Ethereum blockchain.
- OpenZeppelin Contracts: A library for secure smart contract development.

## Contract Details:
- **Name:** Degen (Symbol: DGN)
- **Decimals:** 18 (Tokens are whole numbers)
- **Initial Distribution:** The contract owner can mint tokens initially.
- **Shop Prices:** In-game items are priced in DGN tokens.

## Setup:
1. Deploy the `DegenToken.sol` smart contract to the Ethereum blockchain.
2. Configure the initial token distribution and in-game item prices according to your requirements.
3. Interact with the contract using Ethereum wallets or other smart contracts.

## Usage:
1. **Minting Tokens:**
   - Only the owner can mint new tokens using the `mintDGN` function.
2. **Transferring Tokens:**
   - Players can transfer their tokens to others using the `transferDGN` function.
3. **Redeeming Tokens:**
   - Players can redeem their tokens for in-game items by calling the `redeemDGN` function with the item ID as a parameter.
4. **Checking Token Balance:**
   - Players can check their token balance at any time using the `getBalance` function.
5. **Burning Tokens:**
   - Anyone can burn their own tokens using the `burnDGN` function.

## Author/s:
- Jhon Eleazar P. Tuburan 3.1 BSIT
