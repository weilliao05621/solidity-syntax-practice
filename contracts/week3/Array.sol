// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Array {
    // type 不一樣無法 assign
    uint[] public nums = [1,2,3];
    uint[3] public numsFixed = [3,2,1];

   
    function exmaples() public {
        uint[] memory memNums = nums;
        // 只能對 storage 的內容做 push \ pop
        // 不能直接 assign [1,2,3] 給 uint[] memory
        // 只能這樣改
        memNums[0] = 1; 
        delete memNums[0];

        nums = [1,2,3]; // 可以直接 mutate
        nums = memNums;
        nums[2] = 1;
        nums.push(4);
        // 唯一可以改變 solidity arr.length 的 method
        // 感覺很需要被拿來寫成 utils 或解題   
        nums.pop(); 
        
        delete nums[3];
        if (nums[3] == 0) {
            nums[4] = 3;
        }

    }

    // 很吃 gas 的方式（跟 loop 一樣）
    function getNums() public view returns(uint[] memory) {
        return nums;
    }
}