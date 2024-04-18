// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract OnlyEven {
    constructor(uint a) {
        require(a != 0, "invalid number");
        assert(a != 1);
    }

    function onlyEven(uint256 b) external pure returns(bool success){
        require(b % 2 == 0, "ups! reverting");
        success = true;
    }
}

contract TryCatch {
    event SuccessEvent();
    event CatchEvent(string message);
    event CatchByte(bytes data);

    OnlyEven even;

    constructor() {
        even = new OnlyEven(2);
    }

    // 执行合约异常处理
    function execute(uint amount) external returns (bool success){
        try even.onlyEven(amount) returns (bool _success){
            emit SuccessEvent();
            return _success;
        }
        catch Error(string memory reason){
            emit CatchEvent(reason);
        }
    }

    // 创建合约处理
    function executeNew(uint a) external returns (bool success){
        try new OnlyEven(a) returns (OnlyEven _even) {
            emit SuccessEvent();
            success = _even.onlyEven(a);
        }
        catch Error(string memory reason){
            emit CatchEvent(reason);
        }
        catch (bytes memory reason){
            emit CatchByte(reason);
        }
    }
}