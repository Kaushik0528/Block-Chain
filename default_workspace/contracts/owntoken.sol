// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Mytoken is ERC20{

    uint8 private _customdecimals;
    constructor (string memory name, string memory symbol, uint8 customdecimals) ERC20(name, symbol) {

        _customdecimals = customdecimals;
        _mint(msg.sender,1000*10**uint256 (customdecimals));
    }

    function decimals() public view virtual override returns (uint8) {
        return _customdecimals;
    }
        
    
}
