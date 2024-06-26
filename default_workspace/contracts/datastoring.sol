// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract Datastorage{
    uint storedData;

    function set(uint x) public {
        storedData = x;
    }

    function get() public view returns (uint) {
        return storedData;
    }
}