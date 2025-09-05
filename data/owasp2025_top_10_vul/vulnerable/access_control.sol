pragma solidity ^0.8.0;

contract Solidity_AccessControl {
    mapping(address => uint256) public balances;

    function burn(address account, uint256 amount) public {
        _burn(account, amount);
    }
}
