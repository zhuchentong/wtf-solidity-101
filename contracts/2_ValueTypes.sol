// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// Solidity 变量类型
// 1. 数值类型(Value Type)
// 2. 引用类型(Reference Type)
// 3. 映射类型(Mapping Type)
// 4. 函数类型(Function Type)

// 数值类型
// 1. 布尔值 true | false
// bool public _bool = true;
// 运算 ! && || == !=

// 2. 整形
// int public _int = -1;  # 整数
// uint public _uint = 1; # 正整数
// uint256 public _uint256 = 20240322; # 256位整数

// 3. 地址类型（address） 20个字节
// 地址类型也有成员变量 payable (transfer, send, balance)
// address public _address = 0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;
// address payable public _address1 = payable(_address);
// uint256 public balance = _address1.balance;

// 4.定长字节数组
// 字节数组bytes  定长 | 不定长
// 定长： byte bytes8 bytes32
// 不定长: 引用类型

// bytes32 public _byte32 = "MiniSolidity";
// bytes1 public _byte1 = _byte32[0];

// 5. 枚举 enum
// 为uint分配名称，默认从0开始
// enum ActionSet { Buy, Hold, Sell }
// ActionSet action = ActionSet.Buy;
// 枚举可以显式的与uint进行转换
// uint(action)

contract ValueType {
    bool public _bool = true;

    int public _int = -1; 
    uint public _uint = 1;
    uint256 public _uint256 = 20240322;

    bytes32 public _byte32 = "MiniSolidity";
    bytes1 public _byte1 = _byte32[0];

    enum ActionSet { Buy, Hold, Sell }
    ActionSet action = ActionSet.Buy;
}
