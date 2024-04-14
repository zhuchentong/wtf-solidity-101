// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract OtherContract {
    uint256 private _x = 0;

    event Log(uint amount, uint gas);

    function getBalance() view public returns(uint){
        return address(this).balance;
    }

    function setX(uint256 x) external payable{
        _x = x;

        if(msg.value > 0){
            emit Log(msg.value, gasleft());
        }
    }

    function getX() external view returns(uint256){
        return _x;
    }
}

contract CallContract {
    function callSetX(address _address, uint x) external {
        OtherContract(_address).setX(x);
    }

    function getX_1(address _address) external view returns(uint){
        return OtherContract(_address).getX();
    }

    function getX_2(OtherContract _address)  external view returns(uint){
        return _address.getX();
    }

    function setXTransferETH(address _address, uint x) payable external {
        OtherContract(_address).setX{value: msg.value}(x);
    }
}