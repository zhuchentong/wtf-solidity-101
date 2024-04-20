// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import './IERC20.sol';

contract AirDrop {
    function getSum(uint256[] calldata _arr) public pure returns(uint sum){
        for(uint i=0; i< _arr.length;i++){
            sum = sum + _arr[i];
        }
    }

    // 批量转账（空投）
    function multiTransferToken(address _token, address[] calldata _addresses, uint256[] calldata _amounts) external {
        require(_addresses.length == _amounts.length, "Lengths of Addresses and Amounts NOT EQUAL");
        IERC20 token = IERC20(_token);
        uint _amountSum = getSum(_amounts);
        require(token.allowance(msg.sender, address(this)) >= _amountSum,"Need Approve More ERO20 token");

        for(uint8 i;i < _addresses.length;i++){
            token.transferFrom(msg.sender, _addresses[i], _amounts[i]);
        }
    }

    function multiTransferETH(address payable[] calldata _addresses, uint256[] calldata _amounts) public payable  {
        require(_addresses.length == _amounts.length,"Lengths of Addresses and Amounts Not Require");
        uint _amountSum = getSum(_amounts);

        require(msg.value == _amountSum, "Transfer amount error");

        for(uint256 i=0;i<_addresses.length;i++){
            _addresses[i].transfer(_amounts[i]);
        }
    }
}