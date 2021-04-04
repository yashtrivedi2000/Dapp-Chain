pragma solidity >=0.6.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "./Roles.sol";

//import "@openzeppelin/contracts/access/Ownable.sol"; //https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract ManufacturerRole {
    using Roles for Roles.Role;

    event ManufacturerAdded(address indexed account);
    event ManufacturerRemoved(address indexed account);

    Roles.Role private manufacturers;

    constructor() {
        _addManufacturer(msg.sender);
    }

    // Checks to see if msg.sender has the appropriate role
    modifier onlyManufacturer() {
        require(isManufacturer(msg.sender));
        _;
    }

    // Check if account is an Manufacturer account
    function isManufacturer(address account) public view returns (bool) {
        return manufacturers.has(account);
    }

    // Make account Manufacturer
    function addManufacturer(address account) public {
        _addManufacturer(account);
    }

    // Remove Manufacturer role from account
    function renounceManufacturer() public {
        _removeManufacturer(msg.sender);
    }

    // Internal Functions

    function _addManufacturer(address account) internal {
        manufacturers.add(account);
        emit ManufacturerAdded(account);
    }

    function _removeManufacturer(address account) internal {
        manufacturers.remove(account);
        emit ManufacturerRemoved(account);
    }
}
