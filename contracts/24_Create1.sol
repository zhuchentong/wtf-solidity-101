// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// 智能合约也可以创建智能合约
// uniswap就是利用工厂合约来创建币对合约
// Contract x= new Contract{value: _value}(params)
// 使用new关键字来创建合约，Contract是合约名，x是合约地址

// UniswapV2Pair 币对合约
// UniswapV2Factory 工厂合约

contract Pair {
    address public factory;
    address public token0;
    address public token1;

    constructor() payable {
        factory = msg.sender;
    }

    function initialize(address _token0, address _token1)  external {
        require(msg.sender == factory, "UniswapV2: Forbidden");
        token0 = _token0;
        token1 = _token1;
    }
}

contract PairFactory {
    mapping(address => mapping(address => address)) public getPair;
    address[] public allPairs;

    // 创建新合约
    function createPair(address tokenA, address tokenB) external returns(address pairAddr){
        // 创建新合约
        Pair pair = new Pair();
        // 初始化新合约
        pair.initialize(tokenA, tokenB);
        // 更新地址mapping
        pairAddr = address(pair);
        allPairs.push(pairAddr);
        getPair[tokenA][tokenB] = pairAddr;
        getPair[tokenB][tokenA] = pairAddr;
    }
}