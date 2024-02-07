// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(100);
    }

    function test_setUp() public {
        uint value = counter.number();
        assertEq(value, 100);
        emit log_named_uint("Setted up to", value);
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.number(), 101);
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }
}
