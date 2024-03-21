// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

// All parameters set up in the setUp function apply for all test_ functions
    function setUp() public {
        counter = new Counter();
        counter.setNumber(200);
    }

    function test_setUp() public {
        uint value = counter.number();
        assertEq(value, 200);
        // logging only visible with forge test -vv
        emit log_named_uint("1 - Initial value", value); 
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.number(), 201);
        emit log_string("2 - Incremented by 1");
    }

    function test_getNumber() public {
        test_Increment(); // just to interconnect functions, otherwise they do not 
        uint value = counter.getNumber();
        assertEq(value,201);
        emit log_named_uint("3 - Final value", value);
    }
}
