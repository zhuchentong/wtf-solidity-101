// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


error ErrorTest(uint value);


contract Errors {
    // solidity 有三种抛出异常的方法
    // - error
    // - require
    // - assert

    // revert error 是0.8.4之后添加的内容，可以方便高效的解释操作失败的原因，并可以携带参数
    // 主动抛出异常
    function errorTest(uint _int) public pure returns(uint){
        if(_int==1){
            revert ErrorTest(123);
        }

        return _int;
    }

    // 表达式不成立抛出异常，有描述消息
    function requireTest(uint _int) public pure returns(uint){
        require(_int!=1, "Some Error");
        return _int;
    }

    // 表达式不成立抛出异常，无描述信息
    function assertTest(uint _int) public pure returns(uint){
        assert(_int!=1);
        return _int;
    }

    // gas消耗比较
    // error < assert < require
    // 使用error就好
}