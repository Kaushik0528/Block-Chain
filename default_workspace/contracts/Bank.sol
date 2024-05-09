// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

pragma abicoder v2;

contract SimpleBank {
    struct DepositDetail {
        uint amount;
        uint timestamp;
    }

    mapping(address => uint) private balances;
    mapping(address => DepositDetail[]) private depositHistory;

    event DepositMade(address indexed accountAddress, uint amount);

    function deposit() public payable  {
        //require(_am > 0, "Deposit amount must be greater than 0");
        balances[msg.sender] = balances[msg.sender] + msg.value;

        // Store the deposit detail
        depositHistory[msg.sender].push(DepositDetail(msg.value, block.timestamp));

        emit DepositMade(msg.sender, msg.value);
    }

    function withdraw(uint _amount) public payable{
        require(_amount <= balances[msg.sender], "Insufficient balance");
        payable(msg.sender).transfer(_amount);
        balances[msg.sender] -= _amount;
    }

    function checkBalance() public view returns (uint) {
        return balances[msg.sender];
    }

    // New function to get the deposit history of an account
    function getDepositHistory(address _account) public view returns (DepositDetail[] memory) {
        return depositHistory[_account];
    }
}

