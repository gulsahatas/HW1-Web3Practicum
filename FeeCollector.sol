pragma solidity ^0.8.7; //specify version
// SPDX-License-Identifier: MIT

contract FeeCollector {
    address public owner; // 
    uint256 public balance;
    constructor () {
        owner = msg.sender; // owner is the deployer of the contract

    }
    receive() payable external {
        balance += msg.value; //balance is increased by msg.value whenever someone sends money to the contract
    }

    function withdraw(uint amount, address payable destAddr) public { // this function extracts money from "destAddr" by "amount"
    
        require(msg.sender == owner, "Only owner can withdraw");  //since the withdraw function is public, add a level of security by checking if the function is called by the owner
        require(amount <= balance, "Insufficient funds"); // check if there's enough money on the account to withdraw the specified amount
        destAddr.transfer(amount); //if sonditions are met, transfer "amount" to destAddr
        balance -= amount; //decrease the balance by the withdrawn amount
    }

}
