// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.4; 

contract ArrayAndStruct { 
    // 数组分为固定长度数组和可变长度数组 
    // 固定长度数组：在声明时指定数组的长度。用T[k]的格式声明，其中T是元素的类型，k是数组的长度。 
    uint[8] array1; 
    bytes[5] array2; 
    address[100] array3; 
    // 可变长度数组：在声明时不指定数组的长度。用T[]的格式声明，其中T是元素类型。 
    uint[] public array4; 
    bytes1[] array5; 
    address[] array6; 
    // bytes比较特殊，是单字节数组，即bytes1[] 
    // 在gas费用上，bytes比bytes1[]要更便宜。因为bytes1[]在memory中要增加31个字节进行填充，会产生额外的gas，但是在storage中由于内存紧密打包，它们占用一致。 
    bytes array7; 
    // 创建数组存在如下规则： 
    // 对于memory修饰的动态数组，可以使用new操作符来创建，但是必须声明长度，并且声明后长度不能改变。 
    // 创建数组 new T(k)，T数组类型，k数组长度 
    uint[] array8 = new uint[](5);
    bytes array9 = new bytes(9);
    // 使用字面量可以创建可变长度数组 
    // 字面量创建的数组默认使用该类型下最小单位的类型如: [1,2,3] 为 uint8[] 
    // 字面量创建数组第一个元素显示设置类型后，数组元素都为该类型: [uint(1),2,3] 
    function f() public pure {
         g([uint(1),2,3]);
    } 

    function g(uint[3] memory _array) public pure returns(uint){ 
        return _array[1];
    } 

    function getArray4() public  view returns(uint[] memory){
        return array4;
    }
    // 如果创建的是动态数组，则需要一个一个进行赋值
    function createArray1() public pure returns(uint[] memory){
        uint[] memory _array =  new uint[](4);
        _array[0] = 0;
        _array[1] = 1;
        _array[2] = 9;
        _array[3] = 0;
        return _array;
    }
    // 数组具有以下成员: length数组长度，即数组元素的数量，memory数组长度创建后就是固定的。
    // push(): 动态数组和bytes具有push方法，可以在数组末尾添加一个0元素。
    // push(x): 动态数组和bytes具有push方法，可以在数组末尾添加一个x元素。
    // pop():  动态数组和bytes具有pop方法，可以移除数组最后一个元素。
    function createArray2() public returns(uint[] memory){
        array4.push();
        array4.push(1);
        array4.push(2);
        array4.push(3);
        array4.pop();
        return array4;
    }

    // 结构体是solidity中的自定义类型
    struct Student{
        uint256 id;
        uint256 score;
    }

    Student public student;

    function setStudent1() external returns(Student memory){
        student.id = 1;
        student.score = 100;
        return student;
    }

    function setStudent2() external  returns(Student memory){
        Student storage _student = student;
        _student.id = 2;
        _student.score = 200;
        return _student;
    }
}