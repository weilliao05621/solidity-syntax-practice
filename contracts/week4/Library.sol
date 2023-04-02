// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

/*
    1. 使用 internal 跟 public 最大的差異在於會不會另外 deploy contract
    2. 覺得 lib + using 的概念實在太酷了...，跟 custom modifier 一起用，有更多元做 code splitting
    3. storage 的地方會變成使用 using 的值，所以變成可以直接呼叫而不用再帶入
    ---
    * library: 跟 contract 幾乎差不多，但不一定需要部署，能節省 gas cost
    * using: 讓 storage 的特定 type 都能使用特定的 lib
*/

library Lib {
    error NotFound(uint[] arr, uint x);

    // storage 的 type 只能用在 internal
    function find(uint[] storage arr, uint x) internal view returns (uint) {
        for (uint i = 0; i < arr.length; i++) {
            if (arr[i] == x) {
                return i;
            }
        }

        revert NotFound(arr, x);
    }

    function getStr(string memory _str) internal pure returns (string memory) {
        return _str;
    }
}

contract Test {
    using Lib for uint[];
    using Lib for string;
    uint[] public nums = [3, 2, 1];
    string public str = "hello";

    function testFind() external view returns (uint) {
        // return Lib.find(nums, 3);
        return nums.find(3);
    }

    function testStr() external view returns (string memory) {
        return str.getStr();
    }
}
