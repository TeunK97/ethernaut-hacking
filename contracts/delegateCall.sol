// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract delegateCall {
    address public target;

    constructor(address _contract) {
        target = _contract;
    }

    // This approach was wrong as the owner was set to the address of this contract. 
    function takeOver() public {
        target.call(abi.encodeWithSignature("pwn()"));
    }
}
