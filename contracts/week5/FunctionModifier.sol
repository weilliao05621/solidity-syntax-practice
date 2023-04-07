// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

/*
    1. Can better reuse code
    2. Use underscore in a modifier to represent the rest part of the code
    3. We can have basic logic, input, and decide where to put the modifier
    ---
    * modifier: 撰寫 function 的關鍵詞
    * _ (underscore): 在 modifier function 中表示其他剩餘要執行的 code
    * sandwich: 可以任意排列 _ (underscore) 跟其他要執行 code 的位置
    * modifier 有種另類嘗試在 Solidity 環境下寫 handler
    * require 是類似 assertion
*/

contract FunctionModifier {
    uint public count;
    bool public isPaused = true;

    modifier whenNotPaused () {
        require(isPaused,"paused");
        _;
    }

    modifier cap (uint _value) {
        require(_value < 100, "value should be less than 100.");
        _;
    }

    modifier shoudlResetCount (uint _value) {
        count += _value;
        _;
        if (count > 100 || count < 0) {
            delete count;
        }
    }

    function increase (uint _value) external whenNotPaused cap(_value){
        count += _value;
    }

    // 因為是 uint，不能有負數
    function decrease () external whenNotPaused {
        // 用 require 來做表達正確的 error message
        require(count>0, "count is not larger than 0");
        count--;
    }

    function changeCount (uint _value) external shoudlResetCount(_value) {
        count++;
    }
}   