// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DGNToken is ERC20, Ownable {
    // Event for token minting
    event TokensMinted(address indexed receiver, uint256 amount);

    enum Item {
        LACE,
        MOUSEPAD,
        CHIBI,
        SPEAKER,
        MOUSE_KEYBOARD
    }
    mapping(Item => uint256) public itemPrices;

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
        // Perform actions for redeeming tokens for in-game items
        // For simplicity, let's assume it's not implemented in this contract
        // and tokens are simply burnt
        _burn(msg.sender, itemPrice);
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
}