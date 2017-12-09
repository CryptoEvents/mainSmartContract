pragma solidity ^0.4.18;

import "./ERC20Token.sol";

contract mainSmartContract {
    address public owner;
    uint256 public fees;
    ERC20Token etoken;

    struct smartEvent {
        string name;
        string symbol;
        uint8 decimals;
        address contractEvent;
    }

    mapping(string => smartEvent) internal smartevents;
    address[] public addrevents;
    string[] public accounts;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    function addrPlusString(address x,string str) internal returns (string) {
	bytes memory b = new bytes(20+bytes(str).length);
        for (uint i = 0; i < 20; i++)
    	    b[i] = byte(uint8(uint(x) / (2**(8*(19 - i)))));
    	for (i = 20; i < 20+bytes(str).length; i++)
            b[i] = bytes(str)[i-20];
        return string(b);
    }
                    
    function mainSmartContract(uint256 _fees) public {
        require(_fees>0);
        owner = msg.sender;
        fees = _fees;
    }

    function changeFees(uint8 _fees) onlyOwner public {
        fees = _fees;
    }

    function deployNew(string _name, string _symbol, uint8 _decimals) public payable {
        require(msg.value >= fees);
        //todo: уникальное имя
        string memory uniname = addrPlusString(msg.sender,_name);
        smartevents[uniname].name = _name;
        smartevents[uniname].symbol = _symbol;
        smartevents[uniname].decimals = _decimals;
        smartevents[uniname].contractEvent = new ERC20Token(msg.sender,_name,_symbol,_decimals);
        accounts.push(uniname);
        addrevents.push(smartevents[uniname].contractEvent);
    }
    

    function getContract(string _name) constant public
    returns (smartEvent contracts)
    {
        string memory uniname = addrPlusString(msg.sender,_name);
        contracts = smartevents[uniname];
    }
}
