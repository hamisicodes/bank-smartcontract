// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BankContract {
    address public bankOwner;
    string public bankName;
    mapping (address => uint256) public customerBalance;

    constructor (){
        bankOwner = msg.sender;
    }

    function depositMoney() public payable {
        require(
            msg.value > 0,
            "Deposit amount should be more than 0"
        );
        customerBalance[msg.sender] += msg.value;
    }

    function setbankName(string memory _name) external {
        require(msg.sender == bankOwner, "You must be the owner to set the bank name");
        bankName = _name;
    }

    function withdrawMoney(address payable _to, uint256 _total) public payable {
        require(
            _total < customerBalance[msg.sender],
            "Insufficient amount to withdraw"
        );
        customerBalance[msg.sender] -= _total;
        _to.transfer(_total);
    }

    function getCustomerBalance() external view returns (uint256){
        return customerBalance[msg.sender];
    }

    function getBankBalance() external view returns (uint256){
        require(
            msg.sender == bankOwner,
            "You must be the owner to get Bank balance"
        );
        return address(this).balance;
    }

}