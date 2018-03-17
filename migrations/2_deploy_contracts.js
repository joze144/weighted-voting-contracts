var owner = artifacts.require("./Owner.sol");
var safemath = artifacts.require("./SafeMath.sol");
var standardtoken = artifacts.require("./TokenInterface.sol");
var token = artifacts.require("./Token.sol");
var humanToken = artifacts.require("./HumanToken.sol");

module.exports = function(deployer) {
  deployer.deploy(humanToken, 0, 'WGT', 18, 'WGT');
};
