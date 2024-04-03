// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// function <function name> (<parameter types>) {internal|external|public|private} [pure|view|payable] [<return types>]

// 函数有四种可见性修饰符
// - public 内部外部均可见
// - private 只能从合约内部访问，继承合约也不能用
// - external 只能从合约外部访问
// - internal 只能从合约内部访问，继承合约可以调用

// 合约内函数默认为public，合约外函数默认为internal
// 这些修饰符不仅可以修饰函数，也可以修饰变量
// 变量默认修饰符为internal

// 决定函数权限的关键字为
// - pure (can't read or write)
// - view (can read but can't write)
// - payable

// 调用pure和view函数不需要去支付gas费用

contract FunctionTypes {
    uint256 public number = 5;

    function add() external {
        number = number + 1;
    }

    function addPure(uint256 _number) external pure returns(uint256 new_number){
        new_number = _number+1;
    }

    function addView() external view returns(uint256 new_number){
        new_number = number+1;
    }

    function minus() internal{
        number = number - 1;
    }

    function minusCall() external{
        minus();
    }

    // payable修饰后可以调用支付ETH，由合约地址进行接收
    // 余额返回值默认以Wei为单位
    function minusPayable() external payable returns(uint256 balance){
        minus();
        balance = address(this).balance;
    }
}