// test/FactoryTest.t.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Factory.sol";
import "../src/Beacon.sol";
import "../src/Implementation.sol";

contract FactoryTest is Test {
    Factory factory;
    Beacon beacon;
    Implementation implementation;
    address initialOwner = address(0xa76B88B26Ab5682B8559e7b9689B14Ef602fA08F);

    function setUp() public {
        implementation = new Implementation();
        beacon = new Beacon(address(implementation));
        factory = new Factory(address(implementation));
    }

    function testDeployment() public view {
        assertEq(address(factory), address(factory));
        assertEq(address(beacon), address(beacon));
        assertEq(address(implementation), address(implementation));
        assertEq(beacon.owner(), initialOwner);
    }

    function testCreateProxy() public {
        uint256 initialValue = 42;
        factory.createProxy(initialValue);
        address[] memory proxies = factory.getProxies();
        assertEq(proxies.length, 1);
        Implementation proxy = Implementation(proxies[0]);
        assertEq(proxy.value(), initialValue);
        uint256 fetchedValue = Implementation(address(proxy)).getValue();
        console.log(fetchedValue);
        assertEq(initialValue, fetchedValue);
    }
}
