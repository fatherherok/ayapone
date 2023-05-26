// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";



contract Ayaponetoken is ERC20, Ownable {

    mapping(address => bool) controllers;
    
     event Minter(address to, uint256 amount);

    constructor() ERC20("AyaponeToken", "AYTK") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }


//when owners want to mint subsequently...................
    function mint(address to, uint256 amount) external {
        require(controllers[msg.sender], "Only owner can mint");
        _mint(to, amount);
        emit Minter(to, amount);
    }
        
    

}