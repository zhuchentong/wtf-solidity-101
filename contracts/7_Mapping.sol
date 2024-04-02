// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// 映射类型
contract Mapping {
    // 映射类型的声明格式为： mapping(KeyType => ValueType)
    mapping(uint=>address) public mapping1;
    mapping(address=>address) public mapping2;
    // 规则1: 映射类型中的KeyType只能使用solidity的默认类型，不可以使用结构体，ValueType可以使用结构体类型

    struct Student{
        uint id;
        uint score;
    }

    // mapping(Student=>uint) public mapping3;
    mapping(uint=>Student) public mapping3;

    // 规则2:映射的存储位置必须是Storage，并且不可以作为函数的结果返回和参数

    // 规则3:如果映射声明是public那么会自动创建一个getter函数，可以通过key来查询value

    // 规则4:给映射新增的键值对的语法为data[key]=value
    function setMappingValue(uint key, address value) public{
        mapping1[key] = value;
    }

    // 映射的原理：
    // 1. 映射不存在key的信息，没有length
    // 2. 映射使用keccak256当成offset存取value
    // 3. 未赋值的value和key初始值都是各个类型的默认值
}