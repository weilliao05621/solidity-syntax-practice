// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Keccak256Hash {
    // 要小心 encodePacked 以 text 作為 input 時容易碰撞
    function hash(string memory text, uint num, address addr) external pure returns(bytes32) {
        return keccak256(abi.encodePacked(text,num,addr));
    }

    function encode(string memory text0,  string memory text1) external pure returns(bytes memory) {
        return abi.encode(text0,text1);
    }

    function encodePacked(string memory text0,  string memory text1) external pure returns(bytes memory) {
        return abi.encodePacked(text0,text1);
    }

    function collision(string memory text0,  string memory text1) external pure returns(bytes32) {
        return keccak256(abi.encodePacked(text0,text1));
    }
}