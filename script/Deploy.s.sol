// script/Deploy.s.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/Factory.sol";
import "../src/Beacon.sol";
import "../src/Implementation.sol";

contract Deploy is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        Implementation implementation = new Implementation();
        Beacon beacon = new Beacon(address(implementation));
        Factory factory = new Factory(address(implementation));
        console.log(
            "Implementation contract deployed at:",
            address(implementation)
        );
        console.log("Beacon contract deployed at:", address(beacon));
        console.log("Factory contract deployed at:", address(factory));
        vm.stopBroadcast();
    }
}
