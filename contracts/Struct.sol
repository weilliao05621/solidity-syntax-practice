// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Struct {
     struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car;
    Car[] public cars;

    mapping(address=>Car[]) public carsByOwner;

    function examples() external {
        Car memory toyota = Car("Toyota",1990,msg.sender);
        Car memory lambo = Car({year:1980,model:'Lamborghinl',owner:msg.sender});
        Car memory tesla;

        tesla.model = "Tesla";
        tesla.year = 2010;
        tesla.owner = msg.sender;

        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

        cars.push(Car("Ferrari",2020,msg.sender));

        // 因為是要被記住，所以改用 storage
        Car storage _car  = cars[0];
        _car.year = 1999;

        // 跟 JavaScript 對 Object 做 delete 還是有差異
        // Solidity 做 delete 會變成 default
        // 而沒有 default 的則不會有東西,但看起來也沒有 null
        delete _car.owner;
        delete cars[1];
    }
}