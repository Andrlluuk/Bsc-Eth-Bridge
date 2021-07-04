// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract TokenBase is ERC20 {
  address public admin;
  mapping(address => uint) howManyBlocked;

  constructor(string memory name, string memory symbol) ERC20(name, symbol) {
    admin = msg.sender;
    howManyBlocked[admin] = balanceOf(admin);
  }
  
  function block(address owner, uint amount) public {
    require(balanceOf(onwer) >= howManyBlocked[onwer] + amount, 'invalid number of tokens to be locked');
    howManyBlocked[onwer] = howManyBlocked[onwer] + amount;
  }
    
  function unblock(address owner, uint amount) public {
    require(howManyBlocked[onwer] - amount >= 0, 'invalid number of tokens to be unlocked');
    howManyBlocked[onwer] = howManyBlocked[owner] - amount;
  }
  
  function balanceOfAvailableTokens(address owner, uint amount){
    return balanceOf[owner] - howManyBlocked[owner];
  }

  function updateAdmin(address newAdmin) external {
    require(msg.sender == admin, 'only admin');
    admin = newAdmin;
  }

  function mint(address to, uint amount) external {
    require(msg.sender == admin, 'only admin');
    _mint(to, amount);
  }

  function burn(address owner, uint amount) external {
    require(msg.sender == admin, 'only admin');
    _burn(owner, amount);
  }
}

