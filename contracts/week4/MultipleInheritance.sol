// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

/*
    1. 多個繼承的話，在定義 is 更要在意執行順序
*/

contract X {
    function foo() public pure virtual returns (string memory) {
        return "x";
    }

    function bar() public pure virtual returns (string memory) {
        return "x";
    }

    function x() public pure virtual returns (string memory) {
        return "x";
    }
}

contract Y is X {
    function foo() public pure virtual override returns (string memory) {
        return "y";
    }

    function bar() public pure virtual override returns (string memory) {
        return "y";
    }

    function y() public pure virtual returns (string memory) {
        return "y";
    }
}

contract Z is X, Y {
    function foo() public pure virtual override(X, Y) returns (string memory) {
        return "z";
    }

    function bar() public pure virtual override(X, Y) returns (string memory) {
        return "z";
    }
}
