// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Variable {
    uint public num = 0;
    int public numInt = 0;
    uint32 public num32 = 0;
    address public constant address1 =
        0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    bool public defaultBool;
    uint public defaultUint;
    int public defaultInt;
    address public defaultAddr;
    bytes32 public defaultb32;

    bool[] checks;

    function checkDefault() public returns(bool[] memory){
        bool checkBool = defaultBool == false;
        bool checkUint = defaultUint == 0;
        bool checkInt = defaultInt == 0;
        bool checkAddr = defaultAddr == 0x0000000000000000000000000000000000000000;
        bool checkb32 = defaultb32 == 0x0000000000000000000000000000000000000000000000000000000000000000;
       
        checks.push(checkBool);
        checks.push(checkUint);
        checks.push(checkInt);
        checks.push(checkAddr);
        checks.push(checkb32);

        return checks;
    }

    function getAddressConst() public returns (address) {
        num += 1;
        return address1;
    }

    function getGlobalVars()
        external
        view
        returns (address, uint, uint, uint, address, uint, uint, uint)
    {
        address addr = msg.sender;
        uint timestamp = block.timestamp;
        uint blockNum = block.number;
        uint prevrandao = block.prevrandao;
        address coinbase = block.coinbase;
        uint gasLimit = block.gaslimit;
        uint baseFee = block.basefee;
        uint chainId = block.chainid;

        return (
            addr,
            timestamp,
            blockNum,
            prevrandao,
            coinbase,
            gasLimit,
            baseFee,
            chainId
        );
    }

    function count1() public {
        num += 1;
    }

    function count2() public {
        uint n = 1;
        uint result = n + num;
        num = result;
    }

    function count3() public {
        uint result = num + 1;
        num = result;
    }

    function count1WithBiggerNum() public {
        num += 12222;
    }

    function count1WithExtraBiggerNum() public {
        num += 1222222222;
    }

    function countInt1() public {
        numInt += 1;
    }

    function countInt2() public {
        int n = 1;
        int result = n + numInt;
        numInt = result;
    }

    function countUint32() public {
        num32 += 1;
    }
}
