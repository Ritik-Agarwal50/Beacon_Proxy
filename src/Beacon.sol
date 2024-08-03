// src/Beacon.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/proxy/beacon/UpgradeableBeacon.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Beacon is Ownable, UpgradeableBeacon {
    constructor(
        address implementation_,
        address initialOwner
    ) UpgradeableBeacon(implementation_, initialOwner) {
        transferOwnership(initialOwner); // Use transferOwnership to set the initial owner
    }
}
