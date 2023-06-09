// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract GoodContract {
    mapping (address => uint256) public balances;
   
   function addBalance() public payable {
    balances[msg.sender] += msg.value;
   }

   function withdraw() public {
    require(balances[msg.sender] > 0);
    // Attempt to Transfer
    (bool sent, ) = msg.sender.call{value: balances[msg.sender]}("");
    require(sent, "Failed to send Ether");
    balances[msg.sender] = 0;
   }
}