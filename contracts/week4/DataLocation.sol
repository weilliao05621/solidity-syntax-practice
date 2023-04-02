// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

/*
    1. 若想保存 data 在 contract，存成 storage（一開始定義在合約跟在function定義的都算）
    2. memory 跟 calldata 都是用在 function，但後者只能用在描述 input
    3. 使用 constructor 的話不可以使用 calldata
    ---
    * storage：會保留在 contract
    * memory：使用 memory，可在 function 讀/寫，但 function 執行後即消失
    * calldata：使用 memory，純粹在 function 當作 input 的表達
*/

contract DataLocation {
    struct Condition {
        string day;
        uint workHourPerDay;
        bool isTried;
    }

    mapping(address => mapping(bytes32 hashId => Condition)) records;

    function updateCondition(
        string memory _day,
        uint _workHourPerDay,
        bool _isTried
    ) external {
        Condition memory condition = Condition(_day, _workHourPerDay, _isTried);
        bytes32 h = keccak256(
            abi.encodePacked(_day, _workHourPerDay, _isTried)
        );
        records[msg.sender][h] = condition;

        // storage 不能直接 access 在 memory 裡的
        // Type struct DataLocation.Condition memory is not implicitly convertible to expected type struct DataLocation.Condition storage pointer.
        // Condition storage c = Condition({day:_day});

        Condition storage newCondition = records[msg.sender][h];
        condition = newCondition;
    }

    function draftConditions(
        string calldata _day,
        uint _workHourPerDay,
        bool _isTried
    ) external pure returns (Condition[] memory) {
        Condition memory condition1 = Condition(
            _day,
            _workHourPerDay,
            _isTried
        );
        Condition memory condition2 = Condition(
            "0330",
            _workHourPerDay,
            _isTried
        );
        Condition[] memory conditions = new Condition[](2);

        conditions[0] = condition1;
        conditions[1] = condition2;
        return conditions;
    }

    function forceDayToCurrentDay(
        string memory _day,
        string calldata _dayC
    ) external pure returns (string calldata) {
        // Type literal_string "0330" is not implicitly convertible to expected type string calldata.
        _day = "0330";

        // Return argument type string memory is not implicitly convertible to expected type
        // return _day;
        return _dayC;
    }
}
