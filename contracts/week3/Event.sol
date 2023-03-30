// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Event {
    event Log(string message, uint val);
    event IndexedLog(address indexed sender, uint val);
    event Message(address indexed _from,address indexed _to, string message);

    function trigger() external{
        emit Log("hell world", 1);
        emit IndexedLog(msg.sender,789);
    }

    function sendMessage(address _to,string calldata message) external {
        emit Message(msg.sender,_to,message);
    }
}