// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract SumArray {
    function sumArray(uint256[] calldata arr) public pure returns (uint256) {
        if (arr.length == 0) {
            return 0;
        }

        uint256 sum;

        for (uint256 i = 0; i < arr.length; i++) {
            sum += arr[i];
        }

        return sum;
    }
}
