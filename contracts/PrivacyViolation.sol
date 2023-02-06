// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IPrivacy {
    function unlock(bytes16 _key) external;
}

contract keyExtraction {
    
    // no interface needed for retrieving storage slot
    IPrivacy privacy;
    address privacy_contract;
    bytes32 correctKey = 0x7b5fc422e429efc51f606b3ed53517b027d0b616e0be43a75b3aa0fa1fc12d33;

    constructor(address _privacy) {
        privacy = IPrivacy(_privacy);
        privacy_contract = _privacy;
    } 

    // I fail to retrieve the right bytes32 value here via smart contract.
    // getStorageAt in the terminal works fine
    function useTheKey() public view returns(bytes32) {
        // retrieve stored bytes32 through address 
        bytes32 storedValue = bytes32(keccak256(abi.encodePacked(privacy_contract, uint256(3))));
        return storedValue;
    }

    function useTheCorrectKey() public {
        bytes16 castedKey = bytes16(correctKey);
        privacy.unlock(castedKey);
    }
}