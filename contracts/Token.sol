pragma solidity ^0.4.21;

import './TokenInterface';
import './SafeMath';
import './Owner';

contract Token is TokenInterface, SafeMath, Owner {
    uint8 public decimals;                //How many decimals to show
    uint256 public initialAmount;        //How many tokens each user gets initially
    uint256 public totalSupply;

    mapping(address => uint256) balances;
    mapping (address => mapping (address => uint256)) addressDistribution;

    function transfer(address _to, uint256 _value) returns (bool success) {
        // Assumes totalSupply and initialAmount can't be over max (2^256 - 1)
        if (balances[msg.sender] < _value || balances[_to] + _value <= balances[_to]) {
            return false;
        }
        if (addressDistribution[msg.sender][msg.sender] < _value) {
            return false;
        }
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        addressDistribution[msg.sender][mes.sender] -= value;
        addressDistribution[msg.sender][_to] += value;

        Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
        // Assumes totalSupply and initialAmount can't be over max (2^256 - 1)
        if (balances[_from] < _value || balances[_to] + _value <= balances[_to]) {
            return false;
        }
        if (addressDistribution[msg.sender][_from] < _value || addressDistribution[msg.sender][_to] + _value <= addressDistribution[msg.sender][_to]) {
            return false;
        }
        balances[_from] -= _value;
        balances[_to] += _value;
        addressDistribution[msg.sender][_from] -= value;
        addressDistribution[msg.sender][_to] += value;

        Transfer(msg.sender, _to, _value);
        return true;
    }

    function reset(address _owner) returns (bool success) {
        /// TODO: implement. Looping kind of sucks.. Have to check how people do that
    }

    function addMember() returns (bool success) {
        // TODO: make sure it can be called just once per address
        balances[msg.sender] = initialAmount;
        addressDistribution[msg.sender][msg.sender] = initialAmount;

        AddMember(msg.sender);
        return true;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }

    function totalSupply() public view returns (uint256 supply) {
        return totalSupply;
    }
}
