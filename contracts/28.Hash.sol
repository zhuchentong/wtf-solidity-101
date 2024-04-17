// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// 特性：
// 单向性
// 灵敏性
// 高效性
// 均一性
// 抗碰撞性

// 应用：
// 生成唯一数据标识
// 加密签名
// 安全加密

// Keccak256 哈希函数
// 哈希 = keccak256(数据)

contract HashContract {
    // 生成唯一标识
    function hash(uint _num, string memory _string, address _addr) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_num, _string, _addr));
    }

    // function weak(string memory string1) public view returns(bool){
    //     return keccak256(abi.encodePacked(string1) == _msg);
    // }

    
}