pragma solidity ^0.4.21;


contract TokenInterface {
    /// @return total amount of tokens
    function totalSupply() public view returns (uint256 supply) {}

    /// @param _owner The address from which the balance will be retrieved
    /// @return The balance
    function balanceOf(address _owner) public view returns (uint256 balance) {}

    /// @notice send `_value` token to `_to` from `msg.sender`
    /// @param _to The address of the recipient
    /// @param _value The amount of token to be transferred
    /// @return Whether the transfer was successful or not
    function transfer(address _to, uint256 _value) returns (bool success) {}

    /// @notice send `_value` token to `_to` from `_from` on the condition it is approved by `_from`
    /// @param _from The address of the sender
    /// @param _to The address of the recipient
    /// @param _value The amount of token to be transferred
    /// @return Whether the transfer was successful or not
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {}

    /// @notice resets tokens for the owner. Returns them to owners address
    /// @param _owner The address of the sender
    /// @return Whether the transfer was successful or not
    function reset(address _owner) returns (bool success) {}

    function addMember() returns (bool success) {}

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event AddMember(address indexed _member);
}
