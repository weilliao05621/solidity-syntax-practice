// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract FunctionIntroWithConstructor {
    address public owner;
    uint public x;

    constructor(uint _x) {
        x = _x;
        owner = msg.sender;
    }
    
    
    function add(uint _x, uint _y) external pure returns(uint) {
        return _x + _y;
    }

    function sub(uint _x, uint _y) external pure returns(uint) {
        return _x - _y;
    }
}