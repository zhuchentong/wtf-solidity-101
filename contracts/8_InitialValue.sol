// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract InitialValue{
    // 声明但是没有赋值的变量，都被设置为初始值

    // boolean: false
    // string: ""
    // int: 0
    // uint: 0
    // enum: 第一个元素
    // address: address(0)
    // function 空白函数

    bool public _bool;
    string public _string = "123";
    int public _int;
    uint public _uint;
    bytes1[] public _bytes;
    enum ActionSet {Buy,Hold}
    ActionSet public _enum;

    function f1() internal {}

    function fe() external {}

    // 引用类型也有初始值
    uint[8] public _staticArray = [1,2,3,4,5,6,7,8];  // [0,0,0,0,0,0,0,0]
    uint[] public _dynamicArray = [3,3,3]; // []
    mapping(uint=>address) public _mapping; // 类型默认值
    struct Student{
        uint id;
        uint score;
    }
    // 结构体每个值都是初始值 
    Student public _student;

    // delete 操作符会让变量变为初始值
    // delete 操作动态数组会变为未初始化长度为0的空数组
    function _delete() public{
        delete _dynamicArray;
    }

    function setArray() public{
       _dynamicArray = new uint[](5);
       _dynamicArray[0] = 5;
    }

    function f() public pure returns (bytes1, uint8) {
        bytes memory bs = new bytes(1); //使用new关键字分配空间
        uint8[] memory arr = new uint8[](1);
        return (bs[0], arr[0]); 
    } 

    function d() external pure returns(string memory){
        string memory data = "Custom Data";
        return data;
    }
}