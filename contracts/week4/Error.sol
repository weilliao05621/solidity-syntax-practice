// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

/*
    1. Long error message will cost more gas, and thus we often use "revert" with custom error.
    2. All three original error type have to specify error message
    ---
    * require: 最基本的 input validation，可以 return 自己寫的 error message
    * revert: 跟 require 作用一樣，只是可以等到更 nested logic 最後再 revert
    * assert: 預期設定的條件一定要為 true，會回傳 
    * error: 可以放 input，並自己定義的 error handler
*/

contract ErrorContract {
    uint public count;

    function increase(uint _value) external {
        require(_value < 10, "_value >= 10.");
        require(count < 100, "count >= 100.");
        count += _value;
    }

    // 給 input 後可以被 log 出來
    error inputIsLargerThanTen(uint _value);

    function decrease(uint _value) external view {
        if (count < 0) {
            revert("count < 0");
        }

        if (_value >= 10) {
            revert inputIsLargerThanTen(_value);
        }
    }
}
