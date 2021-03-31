pragma solidity >=0.6.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "./Roles.sol";

contract ResearcherRole {
    using Roles for Roles.Role;

    event ResearcherAdded(address indexed account);
    event ResearcherRemoved(address indexed account);

    Roles.Role private researchers;

    constructor() {
        _addResearcher(msg.sender);
    }

    // Checks to see if msg.sender has the appropriate role
    modifier onlyResearcher() {
        require(isResearcher(msg.sender));
        _;
    }

    // Check if account is an Researcher account
    function isResearcher(address account) public view returns (bool) {
        return researchers.has(account);
    }

    // Make account Researcher
    function addResearcher(address account) public onlyResearcher {
        _addResearcher(account);
    }

    // Remove Researcher role from account
    function renounceResearcher() public {
        _removeResearcher(msg.sender);
    }

    // Internal Functions

    function _addResearcher(address account) internal {
        researchers.add(account);
        emit ResearcherAdded(account);
    }

    function _removeResearcher(address account) internal {
        researchers.remove(account);
        emit ResearcherRemoved(account);
    }
}
