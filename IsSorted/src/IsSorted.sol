// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract IsSorted {
    /**
     * The goal of this exercise is to return true if the members of "arr" is sorted (in ascending order) or false if its not.
     */
    function isSorted(uint256[] calldata arr) public pure returns (bool) {
        for (uint256 i = 1; i < arr.length; i++) {
            uint256 num = arr[i];
            uint256 prevNum = arr[i - 1];
            
            if (num < prevNum) {
                return false;
            }
        }

        return true;
    }
}
