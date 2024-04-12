// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// receive  接收etc的函数
// fallback 处理合约中不存在的函数调用



contract ReceiveAndFallback {
    event Received(address Sender,uint Value);
    event fallbackCalled(address Sender,uint Value,bytes Data);

    // receive 只能用来处理接收ETH
    // 一个合约最多可以有一个receive函数，并且不需要使用function关键字
    // receive() external payable
    // receive不能有任何的参数与返回值，必须包含external payable
    // receive不要执行太多的逻辑，因为gas经常会被限制在2300，太复杂会导致Out of Gas
    receive() external payable {
        emit Received(msg.sender, msg.value);
     }

    // fallback会在调用合约不存在的函数时触发，可以用来接收ETH
    // fallback也不需要使用function来声明
    // fallback需要使用external payable来修饰 
    fallback() external payable{
        emit fallbackCalled(msg.sender, msg.value, msg.data);
    }

    // 合约接收ETH时，msg.data为空且存在receive时，会调用receive；
    // msg.data不为空或不存在receive时，会调用fallback，此时fallback必须是payable
    // receive fallback 均不存在时合约会报错
}