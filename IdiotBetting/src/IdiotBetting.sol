// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract IdiotBettingGame {
    /*
        This exercise assumes you know how block.timestamp works.
        - Whoever deposits the most ether into a contract wins all the ether if no-one 
          else deposits after an hour.
        1. `bet` function allows users to deposit ether into the contract. 
           If the deposit is higher than the previous highest deposit, the endTime is 
           updated by current time + 1 hour, the highest deposit and winner are updated.
        2. `claimPrize` function can only be called by the winner after the betting 
           period has ended. It transfers the entire balance of the contract to the winner.
    */

    mapping(address => uint256) public balances;

    uint256 public highestBet;
    uint256 public highestBalance;
    uint256 public latestBet;

    function bet() public payable {
        if (balances[msg.sender] > 0) {
            balances[msg.sender] += msg.value;
        } else {
            balances[msg.sender] = msg.value;
        }

        if (balances[msg.sender] > highestBalance) {
            highestBalance = balances[msg.sender];
        }

        if (msg.value > highestBet) {
            highestBet = msg.value;
            latestBet = block.timestamp;
        }
    }

    function claimPrize() public {
        require(block.timestamp - latestBet > 1 hours);
        require(balances[msg.sender] == highestBalance);

        uint256 contractBalance = address(this).balance;

        msg.sender.call{value: contractBalance}("");
    }
}
