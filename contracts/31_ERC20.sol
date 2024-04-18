// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// ERC20 是以太坊的一种代币标准
// 它实现了以下逻辑：
// | 账户余额
// | 转账
// | 授权转账
// | 代币总供给
// | 代币信息（名称，代号，小数位）

// IERC20 是 ERC20 代币标准的接口合约
// ERC20  是对合约的实现
// IERC20 是对合约对外接口，共同数据的约定

// IERC20 中定义了2个事件
// 转账事件
// event Transfer(address indexed from, address indexed to, uint256 value);
// 授权事件
// event Approval(address indexed owner, address indexed spender, uint256 value);

// IERC20 中定义了6个函数
// totalSupply 返回代币总供给
// function totalSupply() external view returns (uint256);
// balanceOf 返回账户余额
// function balanceOf(address account) external view returns (uint256);
// transfer 转账
// function transfer(address to, uint256 amount) external returns (bool);
// allowance 返回授权额度
// function allowance(address owner, address spender) external view returns (uint256);
// approve 授权
// function approve(address spender, uint256 amount) external returns (bool);
// transferFrom 授权转账
// function transferFrom(address from, address to, uint256 amount) external returns (bool);
import './IERC20.sol';

contract ERC20 is IERC20{
    mapping(address=>uint256) public override balanceOf;
    mapping(address=>mapping(address=>uint256)) public override allowance;
    // 代币总供给
    uint256 public override totalSupply;
    string public name;
    string public symbol;
    uint8 public decimals = 18;

    constructor(string memory _name, string memory _symbol) payable  {
        name = _name;
        symbol = _symbol;
    }

    function transfer(address recipient, uint amount) external override returns (bool){
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function approve(address spender, uint amount) external override returns(bool){
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) external override returns(bool){
        allowance[sender][msg.sender] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;

        emit Transfer(sender, recipient, amount);
        return true;
    }

    function mint(uint amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply+=amount;

        emit Transfer(address(0), msg.sender, amount);
    }

    function burn(uint amount) external {
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }
}