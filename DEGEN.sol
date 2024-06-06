// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DGNToken is ERC20, Ownable {
    // Event for token minting
    event TokensMinted(address indexed receiver, uint256 amount);
    // Event for item redemption
    event ItemRedeemed(address indexed player, Item item, uint256 amount);

    enum Item {
        LACE,
        MOUSEPAD,
        CHIBI,
        SPEAKER,
        MOUSE_KEYBOARD
    }
    
    mapping(Item => uint256) public itemPrices;
    mapping(address => mapping(Item => uint256)) public playerInventory;

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        // Mint initial supply to the contract deployer
        _mint(msg.sender, 10000 * 1 ** decimals());
        
        // Set item prices
        itemPrices[Item.LACE] = 1000;  
        itemPrices[Item.MOUSEPAD] = 2000;
        itemPrices[Item.CHIBI] = 4000;
        itemPrices[Item.SPEAKER] = 5000;
        itemPrices[Item.MOUSE_KEYBOARD] = 10000; 
    }

    // Function to mint new tokens, only callable by the owner
    function mint(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
        emit TokensMinted(_to, _amount);
    }

    // Function to transfer tokens
    function transferTokens(address _to, uint256 _amount) public {
        _transfer(msg.sender, _to, _amount);
    }

    // Function to redeem tokens for in-game items
    function redeemTokens(Item _item) public {
        uint256 itemPrice = itemPrices[_item];
        require(balanceOf(msg.sender) >= itemPrice, "Insufficient balance");

        // Burn the required amount of tokens
        _burn(msg.sender, itemPrice);
        
        // Add the redeemed item to the player's inventory
        playerInventory[msg.sender][_item] += 1;

        emit ItemRedeemed(msg.sender, _item, 1);
    }

    // Function to check token balance
    function checkTokenBalance(address _player) public view returns (uint256) {
        return balanceOf(_player);
    }

    // Function to burn tokens
    function burnTokens(uint256 _amount) public {
        require(balanceOf(msg.sender) >= _amount, "Insufficient balance");
        _burn(msg.sender, _amount);
    }

    // Function to check player's inventory
    function checkPlayerInventory(address _player, Item _item) public view returns (uint256) {
        return playerInventory[_player][_item];
    }
}
