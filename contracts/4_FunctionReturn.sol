// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// return   用于返回值
// returns  用于指定返回变量以及类型

contract FunctionReturn {
    // 多个返回值使用()包裹，按类型依次排列即可
    function returnMultiple() public pure returns(uint256, bool, uint256[3] memory){
        return (5, true, [uint256(1),2,3]);
    }

    // 命名式返回，在returns中定义返回变量，在函数体内对变量赋值即可
    function returnNamed() public pure returns(uint256 _number, bool _bool, uint256[3] memory _array){
        _number = 2;
        _bool = false;
        _array = [uint256(9),2,1];
    }

    // 可以直接通过解构来获取函数返回值
    // 解构返回值只能按位置进行解构
    // 获取解构返回值需要提前定义变量
    // 不需要保存的解构变量跳过即可(,,_three)
    function DestructionReturn() public pure  returns(uint256, uint256[3] memory){
        uint256 _number;
        uint256[3] memory _array;
        (_number,,) = returnMultiple();
        (,,_array) = returnNamed();
        return (_number, _array);
    }
}