pragma solidity ^0.4.18;

contract mainSmartContract {
  address public owner;
  
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }
  function mainSmartContract() public {
    owner = msg.sender;
  }
}
