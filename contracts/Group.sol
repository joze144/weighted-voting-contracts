pragma solidity ^0.4.19;

import './Token.sol';
import './Owner.sol';

contract Group is Token, Owner {
    function () public {
        //if ether is sent to this address, send it back.
        revert();
    }

    string public name;                   //group name
    string public symbol;                 //An identifier: eg WGT
    string public version = 'G0.1';       //group 0.1 standard. Just an arbitrary versioning scheme.

    function Group(string _groupName, string _tokenSymbol, uint256 _initialAmount, uint8 _decimalUnits) public {
        initialAmount = _initialAmount;
        balances[msg.sender] = _initialAmount;                              // Give the creator all initial tokens
        addressDistribution[msg.sender][msg.sender] = _initialAmount;       // Creator have all of his initial tokens
        totalSupply = _initialAmount;                                       // Update total supply
        name = _groupName;                                                  // Set the name for display purposes
        decimals = _decimalUnits;                                           // Amount of decimals for display purposes
        symbol = _tokenSymbol;                                              // Set the symbol for display purposes
    }
}
