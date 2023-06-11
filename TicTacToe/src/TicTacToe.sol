// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract TicTacToe {
    /* 
        This exercise assumes you know how to manipulate nested array.
        1. This contract checks if TicTacToe board is winning or not.
        2. Write your code in `isWinning` function that returns true if a board is winning
           or false if not.
        3. Board contains 1's and 0's elements and it is also a 3x3 nested array.
    */

    function isWinning(uint8[3][3] memory board) public pure returns (bool) {
        return _checkDiagonalWin(board) || _checkRowWin(board) || _checkColWin(board);
    }

    function _checkDiagonalWin(uint8[3][3] memory board) private pure returns (bool) {
        uint8[3] memory firstRow = board[0];
        uint8[3] memory secondRow = board[1];
        uint8[3] memory thirdRow = board[2];

        if (firstRow[0] == secondRow[1] && firstRow[0] == thirdRow[2]) {
            return true;
        }

        if (firstRow[2] == secondRow[1] && firstRow[2] == thirdRow[0]) {
            return true;
        }

        return false;
    }

    function _checkRowWin(uint8[3][3] memory board) private pure returns (bool) {
        for (uint256 i = 0; i < board.length; i++) {
            uint8[3] memory row = board[i];

            if (row[0] == row[1] && row[0] == row[2]) {
                return true;
            }
        }

        return false;
    }

    function _checkColWin(uint8[3][3] memory board) private pure returns (bool) {
        uint8[3] memory firstRow = board[0];
        uint8[3] memory secondRow = board[1];
        uint8[3] memory thirdRow = board[2];

        for (uint256 i = 0; i < firstRow.length; i++) {
            if (firstRow[i] == secondRow[i] && firstRow[i] == thirdRow[i]) {
                return true;
            }
        }

        return false;
    }
}
