pragma solidity ^0.4.18;

import "./ERC20Token.sol";

contract mainSmartContract {
    address public owner;
    uint256 public fees;


    address[] public addrevents;
    

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
                    
    function mainSmartContract(uint8 _fees) public {
        require(_fees>0);
        owner = msg.sender;
        fees = (uint256)(_fees)*10**16;
    }

    function changeFees(uint8 _fees) onlyOwner public {
        fees = (uint256)(_fees)*10**16;
    }

    function deployNew(string _name, string _symbol, uint8 _decimals) public payable {
        require(msg.value >= fees);
        //todo: уникальное имя
        address contractEvent = new ERC20Token(msg.sender,_name,_symbol,_decimals);
        addrevents.push(contractEvent);
    }
}
