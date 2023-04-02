// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

/*
    1. 像是 TypeScript 先把 interface 定義好，再繼續延伸實際功能
    2. 但更酷的是，這個語法允許我們定義好 interface 後，在 function 執行時再帶入其他 contract 的地址，這樣我們就能根據 interface 去使用該 contract 的程式碼
    3. 通常開源項目也會有 interfaces 的 folder，可以拿來使用
        e.g. https://github.com/Uniswap/v3-core/blob/main/contracts/interfaces/IUniswapV3Factory.sol
    4. Interface 只定義 function，variable 跟 constructor 不是
*/

// 使用 I 作為開頭是 convention
interface ICounter {
    function count() external view returns (uint);

    function increase() external;
}

contract Interface {
    function getCount(address _count) external returns (uint) {
        uint count = ICounter(_count).count();
        ICounter(_count).increase();

        return count;
    }
}
