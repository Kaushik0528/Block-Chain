// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract DLOC {
    uint256[] public arr;
    mapping(uint256 => address) map;

    struct MyStruct {
        uint256 foo;
    }

    mapping(uint256 => MyStruct) myStructs;

    function f() public {

        g(arr, map, myStructs[1]);

        MyStruct storage myStruct = myStructs[1];
        MyStruct memory myMemStruct = MyStruct(0);
    }


    function g(
        uint256[] storage _arr,
        mapping(uint256 => address) storage _map,
        MyStruct storage _myStruct 
    )  internal {

    }

    function h(uint256[] memory _arr) public returns (uint256[] memory) {

    } 

    function y(uint256[] calldata _arr) external {

    }

}