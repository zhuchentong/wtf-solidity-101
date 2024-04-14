contract OtherContract {
    uint256 private _x = 0;

    event Log(uint amount, uint gas);

    function getBalance() view public returns(uint){
        return address(this).balance;
    }
}

contract CallContract {
    
}