// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

/*
    1. Useful for looking up data (avoid looping when data get larger)
    2. Like Dictionary in Python & Map in JavaScript
    3. Mapping can contain mapping
*/

contract Mapping {
    
    mapping(address=>uint) public balanaces;
    mapping(address=>mapping(address=>bool)) public isFriend;

    // gas 30977
    function increaseBalance1(uint value) external {
        balanaces[msg.sender] += value;
    }

    // gas 31105
    function increaseBalance2(uint value) external {
        uint result = balanaces[msg.sender] + value;
        balanaces[msg.sender] = result;
    }

    function getBalance() external view returns(uint) {
        return balanaces[msg.sender];
    }

    function checkBalance(address addr) external view returns(uint) {
        return balanaces[addr];
    }

    function resetBalance() external {
        delete balanaces[msg.sender];
    }

    function addFriend(address addr) external {
        isFriend[msg.sender][addr] = true;
    }

    function checkIsFriend(address addr) external view returns(bool) {
        return isFriend[msg.sender][addr];
    }

    function checkContractIsFriend () external view returns(bool) {
        return isFriend[msg.sender][address(this)];
    }
}