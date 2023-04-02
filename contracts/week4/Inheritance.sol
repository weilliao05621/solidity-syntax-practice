// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

/*
    1. 只有 public virtual 的  function 可以被繼承 & 使用
    ---
    * virtual: 用在 inheritance 的特別 modifier
 */

contract Logger {
    event Log(string message);

    // 這樣的話，就一定要在使用它的 function 也有 calldata 的 _msg 作為 input
    // 所以 calldata 雖然比較省 gas，但也會有彈性上的限制
    function logCalldata(string calldata _msg) public virtual {
        emit Log(_msg);
    }

    function logMemory(string memory _msg) public virtual {
        emit Log(_msg);
    }

    function log() private {
        emit Log("Hi there!");
    }

    function logExternal() external {
        emit Log("Hi there! (external)");
    }
}

contract Hello is Logger {
    function hello(string calldata _msg) public {
        Logger.logCalldata(_msg);
        Logger.logMemory("Hello World");


        // Cannot call function via contract type name.
        // Logger.logExternal();

        // Member "log" not found or not visible after argument-dependent lookup in type(contract Logger).
        // Logger.log();

        // Invalid type for argument in function call. Invalid implicit conversion from literal_string "Hello World" to string calldata requested.
        // Logger.logCalldata("Hello World");
    }
}
