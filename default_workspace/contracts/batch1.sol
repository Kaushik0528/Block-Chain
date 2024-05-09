// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract Batch1Token{


    string public name;
    string public symbol ;
    uint8 public decimals ;
    uint256 public totalSupply;


    mapping (address=> uint256) public balanceOf;
    mapping (address=> mapping (address=> uint256)) public allowance;


    constructor(string memory _name, string memory _symbol, uint8 _decimals,uint256 _initialsupply ){
        name =_name;
        symbol = _symbol;
        decimals =_decimals;
        totalSupply = _initialsupply*10*uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
    }


   
function transfer(address _to, uint256 _value) public returns (bool success){
    balanceOf[msg.sender] -= _value;
    //balanceOf[msg.sender] =  balanceOf[msg.sender]-_value;
    balanceOf[_to] += _value;
    return true;


}
}