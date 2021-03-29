pragma solidity >=0.6.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "./Roles.sol";

//import "@openzeppelin/contracts/access/Ownable.sol"; //https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract ConsumerRole {
    using Roles for Roles.Role;

    event ConsumerAdded(address indexed account);
    event ConsumerRemoved(address indexed account);

    Roles.Role private consumers;

    constructor() {
        _addConsumer(msg.sender);
    }

    // Checks to see if msg.sender has the appropriate role
    modifier onlyConsumer() {
        require(isConsumer(msg.sender));
        _;
    }

    // Check if account is an Consumer account
    function isConsumer(address account) public view returns (bool) {
        return consumers.has(account);
    }

    // Make account Consumer
    function addConsumer(address account) public {
        _addConsumer(account);
    }

    // Remove Consumer role from account
    function renounceConsumer() public {
        _removeConsumer(msg.sender);
    }

    // Internal Functions

    function _addConsumer(address account) internal {
        consumers.add(account);
        emit ConsumerAdded(account);
    }

    function _removeConsumer(address account) internal {
        consumers.remove(account);
        emit ConsumerRemoved(account);
    }
}
