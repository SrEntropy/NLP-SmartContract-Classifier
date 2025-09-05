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

        // Faulty calculation: Incorrectly reducing the user's balance without updating the total lending pool
        userBalances[msg.sender] -= amount;

        // This should update the total lending pool, but it's omitted here.

        payable(msg.sender).transfer(amount);
    }

    function mintReward(address to, uint256 rewardAmount) public {
        // Faulty minting logic: Reward amount not validated
        userBalances[to] += rewardAmount;
    }
}
