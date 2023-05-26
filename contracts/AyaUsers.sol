// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;


import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "hardhat/console.sol";


contract AyaUsers {
    IERC20 _token;

    address public buyer;

    

    event BuyItems(address _buyer,  uint256 _amount);
     event Signup(address _buyer, uint256 _bonus);
     

    // token = AyaToken's contract address
    constructor(address token) {
        _token = IERC20(token);
    }

    // to check token allowance
    modifier checkAllowance(uint amount) {
        require(_token.allowance(msg.sender, address(this)) >= amount, "You do not have sufficient funds");
        _;
    }

    // to deposit an amount of ayatokens to buy items
    function buyItems(uint _amount) public checkAllowance(_amount) {
        _token.transferFrom(msg.sender, address(this), _amount);
        buyer =  msg.sender;
        emit BuyItems(buyer, _amount);
    }



 //add bonus address to array
    address[] bonusAddress;
  //list of bonus wallets
     mapping(address => uint) bonusBenefactor;

   //bonues when the signup...........................
    function userBonus(address toUser, uint _bonus) public {
     require(bonusBenefactor[toUser] >= _bonus, "Address already exists");
     
        _token.transfer(toUser, _bonus);
      
       // bonusAddress.push(toUser);
        bonusBenefactor[toUser] = _bonus;
        emit Signup(toUser, _bonus);

    }

    // to check the total amount of token left
    // function getSmartContractBalance() external view returns(uint) {
    //     return _token.balanceOf(address(this));
    // }
    
}