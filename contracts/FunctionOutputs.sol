// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract FunctionOutput {
    function returnMany() public pure returns (uint, bool) {
        return (1,true);
    }

    function named() public pure returns (uint x, bool b) {
        return (1,true);
    }

    function assigned() public pure returns (uint x,bool b) {
        x = 1;
        b = true;
    }
    
    // 覺得 destruct 很酷
    function destructingAssigments() public pure {
        (uint x, bool b) = returnMany();
        (, bool _b) = returnMany();
    }
}