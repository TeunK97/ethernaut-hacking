// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Elevator {
    function goTo(uint) external;
}

contract Building {
    uint lastFloor = 2;
    Elevator public elevator;
    bool public topFloor = true;

    constructor(address _elevator){
        elevator = Elevator(_elevator);
    }

    // discontinued function
    function discIsLastFloor(uint _floor) external returns(bool){
        if(_floor == lastFloor){
            return true;
        }
        else{
            return false;
        }
    } 

    // second discontinued function: must return false first
    function disc2isLastFloor(uint) view public returns(bool){
        if(!topFloor){
            return true;
        }
        else{
            return false;
        }
    }

    function isLastFloor(uint) public returns (bool){
        topFloor = !topFloor;
        return  topFloor;
    }

    function goTo(uint _floor) public {
        elevator.goTo(_floor);
    }
}