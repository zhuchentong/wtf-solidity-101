// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// EIP & ERC
// ERC是EIP的一部分

// ERC165: 智能合约可以声明它支持的接口供别人检查, 可以用它来检查合约是否支持了ERC721，ERC1155的接口。
// supportsInterface

// IERC721: 使用tokenId来标识特定的非同质化代币，授权转账需要明确的tokenId，而ERC20只需要转账数额

// IERC721事件:
// Transfer
// Approval
// ApprovalForAll

// IERC721函数：
// balanceOf
// ownerOf
// transferFrom
// safeTransferFrom
// approve
// getApproved
// setApprovalForAll
// isApprovedForAll
// safeTransferFrom

// address(to).isContract() 可以来判断地址是否是合约地址

// ERC721使用_checkOnERC721Received来检查目标合约是否实现了onERC721Received函数（selector）

// IERC721Metadata 是 ERC721 的扩展接口，实现了三个metadata的查询
// name() 返回代币名称
// symbol() 返回代币代号
// tokenURI() 通过tokenId查询metadata的链接URL, ERC721特有的函数 

