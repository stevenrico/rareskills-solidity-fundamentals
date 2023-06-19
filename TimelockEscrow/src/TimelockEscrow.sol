// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract TimelockEscrow {
    address public seller;

    mapping(address => uint256) public buyOrders;
    mapping(address => uint256) public buyOrderTimestamps;

    /**
     * The goal of this exercise is to create a Time lock escrow.
     * A buyer deposits ether into a contract, and the seller cannot withdraw it until 3 days passes. Before that, the buyer can take it back
     * Assume the owner is the seller
     */

    constructor() {
        seller = msg.sender;
    }

    // creates a buy order between msg.sender and seller
    /**
     * escrows msg.value for 3 days which buyer can withdraw at anytime before 3 days but afterwhich only seller can withdraw
     * should revert if an active escrow still exist or last escrow hasn't been withdrawn
     */
    function createBuyOrder() external payable {
        buyOrders[msg.sender] = msg.value;
        buyOrderTimestamps[msg.sender] = block.timestamp;
    }

    /**
     * allows seller to withdraw after 3 days of the escrow with @param buyer has passed
     */
    function sellerWithdraw(address buyer) external {
        require(block.timestamp - buyOrderTimestamps[buyer] > 3 days);

        seller.call{value: buyOrders[buyer]}("");
    }

    /**
     * allowa buyer to withdraw at anytime before the end of the escrow (3 days)
     */
    function buyerWithdraw() external {
        require(block.timestamp - buyOrderTimestamps[msg.sender] < 3 days);

        msg.sender.call{value: buyOrders[msg.sender]}("");
    }

    // returns the escrowed amount of @param buyer
    function buyerDeposit(address buyer) external view returns (uint256) {
        return buyOrders[buyer];
    }
}
