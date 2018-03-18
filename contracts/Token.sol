pragma solidity ^0.4.21;

import './TokenInterface';
import './SafeMath';
import './Owner';

contract Token is TokenInterface, SafeMath, Owner {
    uint8 public decimals;                //How many decimals to show
    uint256 public initialAmount;         //How many tokens each user gets initially
    uint256 public totalSupply;           //Total supply of the token

    address[] public addressIndices;                                            //Added addresses
    mapping(address => uint256) balances;                                       //Total balances per address
    mapping(address => address[]) memberAddressIndices;                         //Addresses with token value per member
    mapping (address => mapping (address => uint256)) addressDistribution;      //Distribution per member

    function transfer(address _to, uint256 _value) returns (bool success) {
        // Assumes totalSupply and initialAmount can't be over max (2^256 - 1)
        if (balances[msg.sender] < _value || balances[_to] + _value <= balances[_to]) {
            return false;
        }
        if (addressDistribution[msg.sender][msg.sender] < _value) {
            return false;
        }
        balances[msg.sender] = safeSub(balances[msg.sender], _value);
        balances[_to] = safeAdd(balances[_to], _value);
        addressDistribution[msg.sender][msg.sender] = safeSub(addressDistribution[msg.sender][msg.sender], _value);
        addressDistribution[msg.sender][_to] = safeAdd(addressDistribution[msg.sender][_to], _value);

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
        balances[_from] = safeSub(balances[_from], _value);
        balances[_to] = safeAdd(balances[_to], _value);
        addressDistribution[msg.sender][_from] = safeSub(addressDistribution[msg.sender][_from], _value);
        addressDistribution[msg.sender][_to] = safeAdd(addressDistribution[msg.sender][_to], _value);

        Transfer(_from, _to, _value);
        return true;
    }

    function reset(address _owner) returns (bool success) {
        /// TODO: implement. Have to use memberAddressIndices.. https://medium.com/@blockchain101/looping-in-solidity-32c621e05c22
    }

    function addMember() returns (bool success) {
        for (uint i=0; i<addressIndices.length; i++) {
            if (addressIndices[i] == msg.sender) {
                // Address already registered with the token
                return false;
            }
        }
        addressIndices.push(msg.sender);
        balances[msg.sender] = safeAdd(balances[msg.sender], initialAmount);
        addressDistribution[msg.sender][msg.sender] = initialAmount;
        totalSupply = safeAdd(totalSupply, initialAmount);

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
