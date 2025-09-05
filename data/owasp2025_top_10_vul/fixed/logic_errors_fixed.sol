// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Solidity_LogicErrors {
    mapping(address => uint256) public userBalances;
    uint256 public totalLendingPool;

    function deposit() public payable {
        userBalances[msg.sender] += msg.value;
        totalLendingPool += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");

        // Correctly reducing the user's balance and updating the total lending pool
        userBalances[msg.sender] -= amount;
        totalLendingPool -= amount;

        payable(msg.sender).transfer(amount);
    }

    function mintReward(address to, uint256 rewardAmount) public {
        require(rewardAmount > 0, "Reward amount must be positive");

        // Safeguarded minting logic
        userBalances[to] += rewardAmount;
    }
}
