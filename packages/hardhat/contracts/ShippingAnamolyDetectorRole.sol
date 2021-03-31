pragma solidity >=0.6.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "./Roles.sol";

contract ShippingAnamolyDetectorRole {
    using Roles for Roles.Role;

    event ShippingAnamolyDetectorAdded(address indexed account);
    event ShippingAnamolyDetectorRemoved(address indexed account);

    Roles.Role private shippingAnamolyDetectors;

    constructor() {
        _addShippingAnamolyDetector(msg.sender);
    }

    // Checks to see if msg.sender has the appropriate role
    modifier onlyShippingAnamolyDetector() {
        require(isShippingAnamolyDetector(msg.sender));
        _;
    }

    // Check if account is an ShippingAnamolyDetector account
    function isShippingAnamolyDetector(address account)
        public
        view
        returns (bool)
    {
        return shippingAnamolyDetectors.has(account);
    }

    // Make account ShippingAnamolyDetector
    function addShippingAnamolyDetector(address account)
        public
        onlyShippingAnamolyDetector
    {
        _addShippingAnamolyDetector(account);
    }

    // Remove ShippingAnamolyDetector role from account
    function renounceShippingAnamolyDetector() public {
        _removeShippingAnamolyDetector(msg.sender);
    }

    // Internal Functions

    function _addShippingAnamolyDetector(address account) internal {
        shippingAnamolyDetectors.add(account);
        emit ShippingAnamolyDetectorAdded(account);
    }

    function _removeShippingAnamolyDetector(address account) internal {
        shippingAnamolyDetectors.remove(account);
        emit ShippingAnamolyDetectorRemoved(account);
    }
}
