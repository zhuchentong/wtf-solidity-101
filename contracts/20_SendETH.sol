// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//  有三种方法可以向其他合约发送ETH
//  transfer，send，call
//  优先使用call方法

error SendFailed();
error CallFailed();

contract ReceiveETH {
    event Log(uint amount, uint gas);

    // gasleft() returns (uint256) 返回剩余的gas
    receive() external payable {
        emit Log(msg.value, gasleft());
    }

    function getBalance() view public returns(uint){
        return address(this).balance;
    }
}

// call没有gas限制，提倡使用
// transfer有2300的gas限制，失败会自动revert交易
// send有2300的gas限制，失败不会revert交易，不建议使用
contract SendETH {
    constructor() payable {}

    receive() external payable {}

    function transferEth(address payable _to, uint256 amount) external payable {
        _to.transfer(amount);
    }

    function sendETH(address payable _to, uint256 amount) external payable {
        bool success = _to.send(amount);

        if(!success){
            revert SendFailed();
        }
    }

    function callETH(address payable _to, uint256 amount) external payable {
        (bool success,) = _to.call{value: amount}("");
        if(!success){
            revert CallFailed();
        }
    }

    function getBalance() view public returns(uint){
        return address(this).balance;
    }
}