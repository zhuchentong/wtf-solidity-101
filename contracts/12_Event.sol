// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Event {
    mapping(address=>uint) _balance;
    // event 关键字来定义事件, 参数为记录的内容
    event Transfer(address indexed from, address indexed to, uint256 value);

    // send event
    function _transfer(address from, address to, uint256 amount) external {
        _balance[from] = 1000000;
        _balance[from] -= amount;
        _balance[to] += amount;

        emit Transfer(from, to, amount);
    }
}