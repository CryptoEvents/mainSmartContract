pragma solidity ^0.4.18;

import "./ERC20Token.sol";

contract mainSmartContract {
  address public owner;
  uint public fees;
  ERC20Token etoken;
  
  struct smartEvent {
      string name;
      string symbol;
      uint decimals;
      address contractEvent;
  }
  
  mapping(address => smartEvent) public smartevents;
  
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }
  
  function mainSmartContract(uint8 _fees) public {
    owner = msg.sender;
    fees = _fees;
  }

  function changeFees(uint8 _fees) onlyOwner public {
    fees = _fees;
  }
  
  function deployNew(string _name,string _symbol,uint8 _decimals) payable {
    require(msg.value>fees);
    smartevents[msg.sender].name=_name;
    smartevents[msg.sender].symbol=_symbol;
    smartevents[msg.sender].decimals=_decimals;
    smartevents[msg.sender].contractEvent=new ERC20Token(msg.sender);
  }
  
  function getContract() constant public
          returns (smartEvent contracts)
  {
      contracts = smartevents[msg.sender];
  }
}
