var owner = artifacts.require("./Owner.sol");
var safemath = artifacts.require("./SafeMath.sol");
var standardtoken = artifacts.require("./iToken.sol");
var token = artifacts.require("./Token.sol");
var group = artifacts.require("./Group.sol");
var poll = artifacts.require("./Poll.sol");
var weightedGovernance = artifacts.require("./WeightedGovernance.sol");

module.exports = function(deployer) {
  deployer.deploy(group, 'WGT', 'WGT', 100, 3);
};
