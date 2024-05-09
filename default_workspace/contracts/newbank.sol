// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleBank {
    struct DepositDetail {
        uint amount;
        uint timestamp;
    }

    uint256 public initialValue;
    address public owner;

    mapping(address => uint) private balances;
    mapping(address => DepositDetail[]) private depositHistory;

    event DepositMade(address indexed accountAddress, uint amount);

    constructor() payable {
        owner = msg.sender;
        initialValue = msg.value;  // Initial fund provided by the owner upon deployment
    }

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");

        // Update balance
        balances[msg.sender] += msg.value;

        // Store the deposit detail
        depositHistory[msg.sender].push(DepositDetail({
            amount: msg.value,
            timestamp: block.timestamp
        }));

        emit DepositMade(msg.sender, msg.value);
    }

    function withdraw(uint _amount) public {
        require(_amount <= balances[msg.sender], "Insufficient balance");
        
        // Perform the withdrawal
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }

    function checkBalance() public view returns (uint) {
        return balances[msg.sender];
    }

    // New function to get the deposit history of an account
    function getDepositHistory(address _account) public view returns (DepositDetail[] memory) {
        return depositHistory[_account];
    }
}
