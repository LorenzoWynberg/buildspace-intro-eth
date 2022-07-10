// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 private totalWaves;
    uint256 private totalWavers;
    address[] private waversAddress;
    mapping(address => uint256) public wavers;

    constructor() {
        console.log("Contract Running!");
    }

    function wave() public {
        totalWaves += 1;
        console.log(wavers[msg.sender]);
        if (wavers[msg.sender] == 0) {
            waversAddress.push(msg.sender);
            totalWavers += 1;
        }
        wavers[msg.sender] += 1;
        console.log("%s has waved!", msg.sender);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log(
            "We have %s total waves by %s wavers!",
            totalWaves,
            totalWavers
        );
        return totalWaves;
    }

    function printWavers() public view {
        for (uint256 x = 0; x < totalWavers; x++) {
            console.log(
                "%s Has waved %s times",
                waversAddress[x],
                wavers[waversAddress[x]]
            );
        }
    }
}
