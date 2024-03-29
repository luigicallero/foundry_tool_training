// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public number;

    function setNumber(uint256 _number) public {
        number = _number;
    }

    function increment() public {
        number++;
    }

    function getNumber() public view returns(uint){
        return number;
    }
}
