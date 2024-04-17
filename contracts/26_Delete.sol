// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// 0.8.18后使用会有【不建议使用】的警告，目前还没有替代方案
contract Delete {
    uint public value = 10;

    constructor() payable {}

    receive() external payable {}

    // 删除合约，将合约中的ETH发送到目标地址
    function deleteContract() external {
        selfdestruct(payable(msg.sender));
    }

    function getBalance() external view returns(uint balance){
        balance = address(this).balance;
    }
}