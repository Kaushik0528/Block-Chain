// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Hello
{
    string name;
    function Hellofnc(string memory initName) public {
        name = initName;
    }

    function sayhello() view public returns (string memory, string memory) {
        return ("hello", name);
    }

    function setName(string memory x) public {
        name = x;
    }


}