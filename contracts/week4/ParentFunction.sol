// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract Hello {
    event Log(string message);

    function hello() public virtual {
        emit Log("Hello.hello");
    }

    function greet() public virtual {
        emit Log("Hello.greet");
    }
}

contract HelloWorld is Hello {
    function hello() public virtual override {
        emit Log("HelloWorld.hello");
        Hello.hello();
    }

    function greet() public virtual override {
        emit Log("HelloWorld.greet");
        Hello.greet();
    }
}

contract GreetWorld is Hello {
    function hello() public virtual override {
        emit Log("GreetWorld.hello");
        Hello.hello();
    }

    function greet() public virtual override {
        emit Log("GreetWorld.greet");
        Hello.greet();
    }
}

contract ExtraSoundHelloWorld is HelloWorld, GreetWorld {
    // Linter 太強大了，連要 override 什麼都會提醒
    function hello() public virtual override(HelloWorld, GreetWorld) {
        Hello.hello();
    }

    // 全部都會一起執行，所以如果 function 很多，也會比較貴
    function greet() public virtual override(HelloWorld, GreetWorld) {
        super.greet();
    }
}
