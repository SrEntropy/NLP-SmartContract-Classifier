// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 

contract Solidity_CheckedExternalCall {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function forward(address callee, bytes memory _data) public {
        // Ensure that delegatecall succeeds
        (bool success, ) = callee.delegatecall(_data);
        require(success, "Delegatecall failed");  // Check the return value to handle failure
    }
}