pragma solidity ^0.4.24;

contract Solidity_UncheckedExternalCall {
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    function forward(address callee, bytes _data) public {
        require(callee.delegatecall(_data));
    }
}


pragma solidity ^0.8.0; 

contract Solidity_UncheckedExternalCall {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function forward(address callee, bytes memory _data) public {
        (bool success, ) = callee.delegatecall(_data);
        require(success, "Delegatecall failed");
    }
}