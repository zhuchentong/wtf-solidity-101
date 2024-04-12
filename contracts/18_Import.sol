// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./17_Library.sol";

contract Import {
    Library lib = new Library();

    function getString(uint256 _number) public view returns(string memory){
        return lib.getString1(_number+1);
    } 
}