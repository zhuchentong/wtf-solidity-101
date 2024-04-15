// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// delegatecall 可以在跨合约调用时可以保存原始调用者的状态信息 msg.sender msg.value
// delegatecall 与 call 语法类似
// delegatecall 可以指定交易发送的gas但是不能指定发送的ETH数额
// delegatecall 存在安全隐患

// 使用场景
// 1. 代理合约： 将智能合约的逻辑合约与存储合约分离，通过delegatecall进行调用，当升级时将代理合约指向新的逻辑合约即可。
// 2. EIP-2535

// delegatecall 修改变量修改的是当前合约中的变量

contract C {
    uint public num;
    address public sender;

    event Response(address add);
    


    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;

        emit Response(sender);
    }
}

contract B {
    uint public num;
    address public sender;
    event Response(bool success, bytes data);
    

    function callSetVars(address _addr, uint _num) external payable {
       (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("setVars(uint256)", _num)
       );

       emit Response(success, data);
    }

    function delegateCallSetVars(address _addr, uint _num) external payable {
        (bool success, bytes memory data) = _addr.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );

        emit Response(success, data);
    } 
}