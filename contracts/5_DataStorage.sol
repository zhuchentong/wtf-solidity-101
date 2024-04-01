// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// solidity中的引用类型包括 array | struct | mapping
// solidity中的引用类型使用必须要声明数据存储的位置

// solidity数据储存位置有三种 storage | memory | calldata 
// storage (链上)的gas消费大于 memery, calldata （内存）
// storage为链上存储， memery，calldata为内存存储
// memery与calldata的区别为calldata为不可变类型（immutable），变量不能修改


contract DataStorage {
    uint[] public x = [1, 2, 3];
    
    function getX() public view returns(uint[] memory){
        return x;
    }

    // calldata 存储变量不可以被修改
    function fCalldata(uint[] calldata _x) public pure returns(uint[] calldata){
        // _x[0]=0;
        return _x;
    }    

    // memery 存储变量可以被修改
    function fMemory(uint[] memory _x) public pure returns(uint[] memory){
        _x[0]=0;
        return _x;
    }

    // 1. storage赋值给storage会产生引用，修改会改变原变量值
    function fStorageToSorage() public {
        uint[] storage xStorage = x;
        xStorage[0] = 100;
    }

    // 2. storage赋给memory会创建独立的副本，修改其中一个不会影响另一个
    function fStorageToMemory() public view{
        uint[] memory xMemory = x;
        xMemory[0] = 200;
    }

    // 3. memory赋值给memory会创建引用，改变会影响原变量值。
    function fMemoryToMemory() public pure returns(uint){
        uint[3] memory xMemory = [uint(1),uint(2),uint(3)];
        uint[3] memory yMemory = xMemory;
        yMemory[0] = 300;
        return xMemory[0];
    }

    // 4. memory赋值给storage会创建独立副本，改变不会影响原变量
    function fMemoryToSorage() public returns(uint _int){
        uint[3] memory xMemory = [uint(100),uint(200),uint(300)];
        x = xMemory;
        x[0]=0;
        _int = xMemory[0];
    }

    // solidity 状态的作用域分为三种: 状态变量(state variable), 局部变量(local variable), 全局变量(global variable)
    // 状态变量： 存储在链上的变量，所有和合约内函数都可以访问，gas消耗高，在合约内，函数外声明。
    // 局部变量： 仅在函数执行过程中有效的变量，函数退出后变量无效，局部变量输出存储在内存，不上链，gas费用低。
    // 全局变量： 全局变量是全局范围工作的变量，都是solidity预留的关键字，可以不声明直接使用。如(msg.sender，msg.data, block.number)
}

    // blockhash 给定区块的哈希值
    // block.coinbase 当前矿工区块的地址
    // block.gaslimit 当前区块的gaslimit
    // block.number 当前区块的number
    // block.timestamp 当前区块的时间戳
    // gasleft() 剩余gas
    // msg.data  完整的calldata
    // msg.sender 消息发送者，当前caller
    // msg.sig  calldata的前四个字节
    // msg.value 当前交易发送的wei值