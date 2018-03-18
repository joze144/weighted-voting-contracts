pragma solidity ^0.4.21;

import './Token';

contract HumanToken is Token {

    function () {
        //if ether is sent to this address, send it back.
        revert();
    }

    string public name;                   //token name..
    string public symbol;                 //An identifier: eg SBX
    string public version = 'H0.1';       //human 0.1 standard. Just an arbitrary versioning scheme.

    function HumanToken(uint256 _initialAmount, string _tokenName, uint8 _decimalUnits, string _tokenSymbol) {
        initialAmount = _initialAmount;
        balances[msg.sender] = _initialAmount;                              // Give the creator all initial tokens
        addressDistribution[msg.sender][msg.sender] = _initialAmount;      // Creator have all of his initial tokens
        totalSupply = _initialAmount;                                       // Update total supply
        name = _tokenName;                                                  // Set the name for display purposes
        decimals = _decimalUnits;                                           // Amount of decimals for display purposes
        symbol = _tokenSymbol;                                              // Set the symbol for display purposes
    }
}
