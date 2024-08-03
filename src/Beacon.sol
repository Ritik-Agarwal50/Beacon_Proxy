// src/Beacon.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/proxy/beacon/UpgradeableBeacon.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Beacon is Ownable, UpgradeableBeacon {
    constructor(
        address implementation_
    )
        UpgradeableBeacon(
            implementation_,
            0xa76B88B26Ab5682B8559e7b9689B14Ef602fA08F
        )
    {
        // Use transferOwnership to set the initial owner
    }
}
