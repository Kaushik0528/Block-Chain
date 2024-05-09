// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract TokenA is ERC20 {
    constructor (uint256 initialSupply) ERC20("Token A","EXTK") {

        _mint(msg.sender, initialSupply);
    }

}


contract TokenB is ERC20 {
        constructor (uint256 initialsupply) ERC20("Token B", "TKEMP") {
        _mint(msg.sender, initialsupply);
    }
}
