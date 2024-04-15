// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// 不推荐使用call来调用另一个合约
// 当不知道对方合约源代码和ABI就没法生成合约变量，这是我们可以通过call调用合约函数
// 生成二进制编码需要使用结构化函数`abi.encodeWithSignature`
// abi.encodeWithSignature("函数签名",具体参数)
// 目标合约地址.call{value:发送数额, gas:gas数额}(二进制编码);

contract OtherContract {
    uint256 private _x = 0; // 状态变量x
    // 收到eth的事件，记录amount和gas
    event Log(uint amount, uint gas);
    
    // 返回合约ETH余额
    function getBalance() view public returns(uint) {
        return address(this).balance;
    }

    // 可以调整状态变量_x的函数，并且可以往合约转ETH (payable)
    function setX(uint256 x) external payable{
        _x = x;
        // 如果转入ETH，则释放Log事件
        if(msg.value > 0){
            emit Log(msg.value, gasleft());
        }
    }

    // 读取x
    function getX() external view returns(uint x){
        x = _x;
    }
}

contract Call {
    event Response(bool success, bytes data);
    
    // 调用合约SetX
    function callSetX(address payable _address, uint256 x) public payable {
        (bool success, bytes memory data) = _address.call{value: msg.value}(
            abi.encodeWithSignature("setX(uint256)", x)
        );

        emit Response(success, data);
    }

    // 调用合约GetX
    function callGetx(address _address) external returns(uint256){
        (bool success, bytes memory data) = _address.call(
            abi.encodeWithSignature("getX()")
        );

        emit Response(success, data);
        return abi.decode(data, (uint256));
    }

    function callNonExist(address _address) external {
        (bool success, bytes memory data) = _address.call(
            abi.encodeWithSignature("foo(uint256)")
        );

        emit Response(success, data);
    }
}