// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract InsertionSort {
    function ifTest(uint _number) public pure returns(bool){
        if(_number == 0){
            return(true);
        }else{
            return(false);
        }
    }

    function forTest() public pure returns(uint){
        uint sum = 0;
        for(uint i =0 ;i<10;i++){
            sum+=i;
        }
        return sum;
    }

    function whileTest() public pure returns(uint){
        uint sum = 0;
        uint i = 0;

        while (i<10){
            sum+=i;
            i++;
        }

        return sum;
    }

    function doWhileTest() public pure returns(uint){
        uint sum = 0;
        uint i = 0;

        do{
            sum+=i;
            i++;
        }
        while(i<10);

        return sum;
    }

    function ternaryTest(uint x,uint y) public pure returns (uint256){
        return x>=y?x:y;
    }

    uint[] public _array;

    function arrayTest() public returns(uint[] memory){
        uint i = 0;
        while(i<10){
            i++;
            if(i==2){
                continue ;
            }

            if(i==4){
                break;
            }

            _array.push(i);

        }
        
        return _array;
    }


    function getArray() public view returns(uint[] memory){
        return _array;
    }

    function insertionSort(uint[] memory _arr) public pure returns(uint[] memory){
        for(uint i = 1;i<_arr.length;i++){
            uint value = _arr[i];
            uint j = i;

            while((j>=1)&&(_arr[j-1] > value)){
                _arr[j] = _arr[j-1];
                j--;
            }

            _arr[j] = value;
        }

        return _arr;
    }

}