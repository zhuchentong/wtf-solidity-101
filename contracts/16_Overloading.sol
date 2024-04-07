// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Overloading {
    // solidity允许重载，输入参数不同的函数被视为不同的函数
    // solidity不允许装饰器重载

    function doSomething() public pure returns(string memory){
        return "to do 1";
    }

    function doSomething(string memory something) public pure returns(string memory){
        return something;
    }

    function f(uint8 _int) public pure returns(uint8){
        return _int+1;
    }

    function f(uint256 _int) public pure returns(uint256){
        return _int+2;
    }

    function c() public pure {
        f(500);
    }
}