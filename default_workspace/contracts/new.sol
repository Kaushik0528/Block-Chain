// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract bank{

    constructor() payable {}

    mapping(address => uint256) public balance;

    event transfer( address indexed from , address indexed to , uint256 amount);

    function transferfunds( address payable from , address payable to, uint256 amount ) public payable returns (bool successfull){
        //conditon
        require(to != address(0));
        require(from != address(0));
        require(balance[from] >= amount);
        
        balance[from] -= amount;
        balance[to] += amount;
        emit transfer(from,to,amount);
        return true;
    }
}