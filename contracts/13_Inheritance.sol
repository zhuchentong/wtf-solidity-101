// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Inheritance {
    // 使用继承可以重写函数
    // 父合约中使用 virtual  关键字
    // 字合约中使用 override 关键字
    // mapping(address => uint256) public override balanceOf;
}

contract Yeye {
    event Log(string msg);

    function hip() public virtual {
        emit Log("Yeye");
    }

    function pop() public virtual{
        emit Log("Yeye");
    }

    function yeye() public virtual {
        emit Log("Yeye");
    }
}

contract Baba is Yeye{
      function hip() public virtual  override  {
        emit Log("Baba");
    }

    function pop() public virtual  override{
        emit Log("Baba");
    }

    function baba() public virtual {
         emit Log("Baba");
    }
}

// 多合约继承一定要按顺序书写
// 如果一个函数在多个继承合约都存在，则必须在字合约中重写
// 多个父合约中存在同样名称的函数，重写时需要添加父合约名称
contract Erzi is Yeye, Baba {
    function hip() public virtual override(Yeye, Baba){
        emit  Log("Erzi");
    }

    function pop() public virtual  override (Yeye, Baba){
        emit Log("Erzi");
    }


    // 子合约函数可以利用super关键字来调用父合约函数
    function callParent() public {
        super.pop();
    }

    // 子合约函数可以利用父合约名来调用相应函数
    function callYeye() public {
        Yeye.pop();
    }
}

// 装饰器同样支持继承
contract Base1 {
    modifier limit2And3(uint _int) virtual {
        require(_int==2 || _int ==3);
        _;
    }
}

contract Identifier is Base1 {
    modifier limit2And3(uint _int) override {
        _;
        require(_int==2);
    }

    function getNumber(uint _int) public limit2And3(_int) pure returns(uint){
        return _int;
    }
}

// 构造函数也同样支持继承，使用abstract关键字
abstract contract A{
    uint public a;

    constructor(uint _a) {
        a = _a;
    }
}

contract B is A {
    constructor(uint _c) A(_c*_c) {}
}

// 钻石继承|菱形继承
contract God {
    event Log(string message);

    function foo() public virtual {
        emit Log("God.foo called");
    }

    function bar() public virtual {
        emit Log("God.bar called");
    }
}

contract Adam is God {
    function foo() public virtual override {
        emit Log("Adam.foo called");
        super.foo();
    }

    function bar() public virtual override {
        emit Log("Adam.bar called");
        super.bar();
    }
}

contract Eve is God {
    function foo() public virtual override {
        emit Log("Eve.foo called");
        super.foo();
    }

    function bar() public virtual override {
        emit Log("Eve.bar called");
        super.bar();
    }
}

// 会使用Eve, Adam, God顺序反向调用
contract people is Adam, Eve {
    function foo() public override(Adam, Eve) {
        super.foo();
    }

    function bar() public override(Adam, Eve) {
        super.bar();
    }
}
