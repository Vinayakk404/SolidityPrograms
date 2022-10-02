pragma solidity ^0.8.13;

contract Storage
{
    address public owner;
    mapping(address=>uint)public balances;
    constructor() 
    {
        owner=msg.sender;
        balances[address(this)]=100;
    }
    function getBalance() public view returns(uint)
    {
        return   balances[address(this)];
    }
    function reStock(uint  value) public  returns(uint)
    {
        require(msg.sender==owner,"Not the owner");
          balances[address(this)]=  balances[address(this)]+value;
          return   balances[address(this)];
    }
    function purchase(uint amount) public payable
    {
        require(msg.value<=amount*2 ether,"Pay at least 2 ether");
        require(balances[address(this)]>amount,"No balance in the wallet");
        balances[address(this)]-=amount;
        balances[msg.sender]+=amount;
    }
}