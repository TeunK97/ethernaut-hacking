// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract DenialOfService {
    function kickKing(address payable _to) public payable {
        (bool sent,) = _to.call{value: msg.value}("");
        require(sent);
    }
}