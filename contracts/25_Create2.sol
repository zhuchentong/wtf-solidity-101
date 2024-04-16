// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// CREATE2 操作码使我们在智能合约部署在以太坊网络之前就能 [预测合约地址]
// Uniswap创建Pair合约使用的是CREATE2

// CREATE计算地址： 新地址 = hash(创建者地址, nonce)
// CREATE2计算地址：新地址 = hash("0xFF", 创建者地址，salt，bytecode)

// Contract x = new Contract{salt: _salt, value: _value}(params);

contract Pair{
    address public factory; // 工厂合约地址
    address public token0; // 代币1
    address public token1; // 代币2

    constructor() payable {
        factory = msg.sender;
    }

    // called once by the factory at time of deployment
    function initialize(address _token0, address _token1) external {
        require(msg.sender == factory, 'UniswapV2: FORBIDDEN'); // sufficient check
        token0 = _token0;
        token1 = _token1;
    }
}

contract PairFactory{
    mapping(address => mapping(address => address)) public getPair; // 通过两个代币地址查Pair地址
    address[] public allPairs; // 保存所有Pair地址

    function createPair(address tokenA, address tokenB) external returns (address pairAddr){
        require(tokenA != tokenB, "IDENTICAL_ADDRESSES");
        // 对地址进行排序
        (address token0, address token1) = tokenA < tokenB? (tokenA, tokenB): (tokenB, tokenA);
        // 计算地址salt
        bytes32 salt = keccak256(abi.encodePacked(token0, token1));
        // 部署新合约
        Pair pair = new Pair{salt: salt}();
        // 初始化合约
        pair.initialize(tokenA, tokenB);
        // 更新地址mapping
        pairAddr = address(pair);
        allPairs.push(pairAddr);
        getPair[tokenA][tokenB] = pairAddr;
        getPair[tokenB][tokenA] = pairAddr;
    }

    // 预测合约地址
    function calculateAddr(address tokenA, address tokenB) public view returns(address predictedAddress){
        require(tokenA != tokenB, "IDENTICAL_ADDRESSES");
        //将tokenA和tokenB按大小排序
        (address token0, address token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
         // 计算地址salt
        bytes32 salt = keccak256(abi.encodePacked(token0, token1));
        predictedAddress = address(uint160(uint(keccak256(abi.encodePacked(
            bytes1(0xff),
            address(this),
            salt,
            keccak256(type(Pair).creationCode)
        )))));
    }
}