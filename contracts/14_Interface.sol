// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// 创建抽象合约使用abstract关键字，该合约只能用来继承，不可以直接部署
// 抽象合约中未实现的函数需要添加virtual关键字
abstract contract A {
    function insert(uint _int) public pure virtual returns(uint); 
}

// 接口类似与抽象合约有一下规则：
// - 不能包含状态变量
// - 不能包含构造函数
// - 不能继承除接口外的其他合约
// - 所有函数都必须是external不能有函数体
// - 继承接口的合约必须实现接口定义的所有功能

// 接口与合约ABI等价，可以互相转换
interface IERC721 {
    // 转账事件
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    // 授权事件
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);
    // 批量授权事件
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);
    // 余额查询
    function balanceOf(address owner) external view returns (uint256 balance);
    // 返回合约拥有者
    function ownerOf(uint256 tokenId) external view returns (address owner);
    // 安全转账
    function safeTransferFrom(address from, address to, uint256 tokenId) external;
    // 普通转账
    function transferFrom(address from, address to, uint256 tokenId) external;
    // 授权操作
    function approve(address to, uint256 tokenId) external;
    // 查询授权地址
    function getApproved(uint256 tokenId) external view returns (address operator);
    // 设置批量授权地址
    function setApprovalForAll(address operator, bool _approved) external;
    // 查询是否批量授权地址
    function isApprovedForAll(address owner, address operator) external view returns (bool);
    // 安装转账重载
    function safeTransferFrom( address from, address to, uint256 tokenId, bytes calldata data) external;
}

// 当知道一个合约的接口时，就可以实现与它直接交互