pragma solidity ^0.4.17;

contract Solidity_OverflowUnderflow {
    uint8 public balance;

    constructor() public {
        balance = 255;
    }

    function increment(uint8 value) public {
        balance += value;
    }

    // Decrements the balance by a given value
    function decrement(uint8 value) public {
        balance -= value;
    }
}