const Group = artifacts.require("./Group.sol");

contract('Group', async (accounts) => {

  it("should put tokens to the first account", async () => {
    let instance = await Group.deployed();
    let balance = await instance.balanceOf.call(accounts[0]);
    assert.equal(balance.valueOf(), 10000);
  })
})