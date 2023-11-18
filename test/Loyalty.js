require("@nomicfoundation/hardhat-toolbox/network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");

describe("Loyalty", function() {
  it("SSS", async function() {
    const Loyalty = await ethers.getContractFactory("Loyalty");
    const contract = await Loyalty.deploy(unlockTime, { value: lockedAmount });
  })
})