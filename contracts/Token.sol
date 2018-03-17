pragma solidity ^0.4.21;

import './TokenInterface';
import './SafeMath';
import './Owner';

contract Token is TokenInterface, SafeMath, Owner {
    mapping(address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed; // TODO: change

    function transfer(address _to, uint256 _value) returns (bool success) {
        //Assumes totalSupply can't be over max (2^256 - 1).
        /// TODO: change :)
        if (balances[msg.sender] >= _value && balances[_to] + _value > balances[_to]) {
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            Transfer(msg.sender, _to, _value);
            return true;
        } else { return false; }
    }

    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
        /// TODO: change :)
        if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value && balances[_to] + _value > balances[_to]) {
            //if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value && _value > 0) {
            balances[_to] += _value;
            balances[_from] -= _value;
            allowed[_from][msg.sender] -= _value;
            Transfer(_from, _to, _value);
            return true;
        } else { return false; }
    }

    function reset(address _owner) returns (bool success) {
        /// TODO: implement
    }

    function addMember(address _member) returns (bool success) {
        // TODO: implement
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }

    function totalSupply() public view returns (uint256 supply) {
        return totalSupply;
    }
}
