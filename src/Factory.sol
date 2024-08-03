// src/Factory.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Beacon.sol";
import "./BeaconProxy.sol";
import "./Implementation.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Factory {
    address public beacon;
    address[] public proxies;

    event ProxyCreated(address proxy);

    constructor(address _implementation) {
        beacon = address(new Beacon(_implementation));
    }

    function createProxy(uint256 _value) external {
        bytes memory data = abi.encodeWithSelector(
            Implementation.initialize.selector,
            _value
        );
        MyBeaconProxy proxy = new MyBeaconProxy(beacon, data);
        proxies.push(address(proxy));
        emit ProxyCreated(address(proxy));
    }

    function getProxies() external view returns (address[] memory) {
        return proxies;
    }
}
