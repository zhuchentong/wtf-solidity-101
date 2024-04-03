// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ConstructorAndModifier {
    // 构造函数只在每次部署合约时执行，常用来保存owner地址
    address owner;

    constructor(){
        // 保存合约部署者地址
        owner = msg.sender;
    }

    // 修饰起（modifier）

    modifier onlyOwner{
        // 检查调用者是否为owner
        require(msg.sender == owner);
        // _表示继续函数体的运行
        _;
    }

    function changeOwner(address _newOwner) external onlyOwner{
        owner = _newOwner;
    }
}