// script/Deploy.s.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/Factory.sol";
import "../src/Beacon.sol";
import "../src/Implementation.sol";

contract Deploy is Script {
    function run() external {
        // Load the private key from environment variable
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        // Start broadcasting transactions
        vm.startBroadcast(deployerPrivateKey);

        // Deploy Implementation contract
        Implementation implementation = new Implementation();
        console.log("Implementation contract deployed at:", address(implementation));

        // Deploy Beacon contract with the implementation address and an initial owner
        address initialOwner = address(this); // or any other address
        Beacon beacon = new Beacon(address(implementation), initialOwner);
        console.log("Beacon contract deployed at:", address(beacon));

        // Deploy Factory contract with the implementation address and the initial owner
        Factory factory = new Factory(address(implementation), initialOwner);
        console.log("Factory contract deployed at:", address(factory));

        // Stop broadcasting transactions
        vm.stopBroadcast();
    }
}
