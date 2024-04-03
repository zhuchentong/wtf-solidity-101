// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Constant {
    
    // constant(常量)和immutable(不可变量)。状态变量声明后不能在更改值
    // 需要注意的是只有数值类型可以声明constant和immutable
    // string和bytes可以声明为constant，不能为immutable

    // constant 需要在声明时赋值
    uint constant public constant_uint = 10;
    string constant public constant_string = "0xaa";
    bytes constant constant_bytes = "WTF";
    address constant constant_address = 0x0000000000000000000000000000000000000000;
    address immutable public constant_address_1 = address(0);
    // immutable 可以在声明时或者构造函数中初始化
    uint public immutable immutable_uint = 99;
    address public immutable immutable_address;
    uint256 public immutable immutable_block;
    uint256 public immutable immutable_test;

    constructor(){
        immutable_address = address(this);
        immutable_block = block.number;
        immutable_test = test();
    }

    function test() public pure returns(uint256){
        uint256 _number = 9;
        return(_number);
    }
}