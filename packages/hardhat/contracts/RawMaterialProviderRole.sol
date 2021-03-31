pragma solidity >=0.6.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "./Roles.sol";

contract RawMaterialProviderRole {
    using Roles for Roles.Role;

    event RawMaterialProviderAdded(address indexed account);
    event RawMaterialProviderRemoved(address indexed account);

    Roles.Role private rawMaterialProviders;

    constructor() {
        _addRawMaterialProvider(msg.sender);
    }

    // Checks to see if msg.sender has the appropriate role
    modifier onlyRawMaterialProvider() {
        require(isRawMaterialProvider(msg.sender));
        _;
    }

    // Check if account is an RawMaterialProvider account
    function isRawMaterialProvider(address account) public view returns (bool) {
        return rawMaterialProviders.has(account);
    }

    // Make account RawMaterialProvider
    function addRawMaterialProvider(address account)
        public
        onlyRawMaterialProvider
    {
        _addRawMaterialProvider(account);
    }

    // Remove RawMaterialProvider role from account
    function renounceRawMaterialProvider() public {
        _removeRawMaterialProvider(msg.sender);
    }

    // Internal Functions

    function _addRawMaterialProvider(address account) internal {
        rawMaterialProviders.add(account);
        emit RawMaterialProviderAdded(account);
    }

    function _removeRawMaterialProvider(address account) internal {
        rawMaterialProviders.remove(account);
        emit RawMaterialProviderRemoved(account);
    }
}
