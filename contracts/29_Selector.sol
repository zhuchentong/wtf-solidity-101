// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// 函数签名中 uint 需要写为 uint256
// selector 为函数的选择器，在calldata的前四个字节就是selector
// 通过selector可以标识出需要调用的函数

contract Selector {
    event Log(bytes data, address to);

    function mint(address to) external {
        emit Log(msg.data, to);
    }

    function mintSelector() external pure returns(bytes4){
        return bytes4(keccak256("mint(address)"));
    }

    function mintTransfer() external pure returns(bytes4){
        return bytes4(keccak256("transfer(address,uint256)"));
    }

    // method id 就是函数签名的Keccak哈希后的前四个字节
    // 当selector与method id相匹配时，即表示调用该函数
    
    function callWithSignature() external returns(bool, bytes memory){
        (bool success, bytes memory data) = address(this).call(abi.encodeWithSelector(this.mintSelector(), address(this)));
        return (success, data);
    }
}