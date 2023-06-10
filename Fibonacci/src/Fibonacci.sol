// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Fibonacci {
    /*
        This exercise assumes you understand what Fibonacci sequence is.
        1. Function `fibonacci` takes a uint256 as argument and returns nth fibonacci number.
        
        Fibonacci sequence are 0,1,1,2,3,5,8,13,....
        
        calling fibonacci(6) would return 5, because the 6th Fibonacci number is 8.
    */

    function fibonacci(uint256 _position) public pure returns (uint256) {
        uint256 seqNum = 0;
        uint256 nextNum = 1;
        uint256 sum;

        for (uint256 i = 1; i < _position; i++) {            
            sum = seqNum + nextNum;
            seqNum = nextNum;
            nextNum = sum;
        }

        /*
        _position = 1 => 1
        no loop: sum = -; seqNum = 0; nextNum = 1;
        
        _position = 4 => 2
        after i1: sum = 1; seqNum = 1; nextNum = 1;
        after i2: sum = 2; seqNum = 1; nextNum = 2;
        after i3: sum = 3; seqNum = 2; nextNum = 3;
        after i4: sum = 5; seqNum = 3; nextNum = 5;
        
        */
        
        return seqNum;
    }
}
