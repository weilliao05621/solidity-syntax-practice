// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

/*
    1. 可以直接在 is 那邊定義 static value
    2. 也可以在 constructor 階段定義 dynamic value
    3. 執行的順序是按照一開始定義 contract
        e.g. contract UseParent2 is Start, Second: Start > Second > UseParent
*/

contract Start {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract Second {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

contract UseParent1 is Start("Weil"), Second("Hi there!") {

}

contract UseParent2 is Start, Second {
    constructor(
        string memory _name,
        string memory _text
    ) Start(_name) Second(_text) {
        name = _name;
        text = _text;
    }
}
