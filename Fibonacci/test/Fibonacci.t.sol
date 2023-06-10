// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Fibonacci.sol";

contract FibonacciTest is Test {
    Fibonacci public fibonacci;

    function setUp() public {
        fibonacci = new Fibonacci();
    }

    function testFibonacci() external {
        uint256 result1 = fibonacci.fibonacci(1);
        uint256 result2 = fibonacci.fibonacci(2);
        uint256 result3 = fibonacci.fibonacci(3);
        uint256 result4 = fibonacci.fibonacci(4);
        uint256 result5 = fibonacci.fibonacci(8);

        assertEq(result1, 0, "expected result to be 0");
        assertEq(result2, 1, "expected result to be 1");
        assertEq(result3, 1, "expected result to be 1");
        assertEq(result4, 2, "expected result to be 2");
        assertEq(result5, 13, "expected result to be 13");
    }
}
