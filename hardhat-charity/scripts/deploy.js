const { ethers } = require("hardhat");

async function main() {
  /*
  A ContractFactory in ethers.js is an abstraction used to deploy new smart contracts,
  so whitelistContract here is a factory for instances of our Whitelist contract.
  */
  const charityContract = await ethers.getContractFactory("Charity");

  // here we deploy the contract
  const deployedcharityContract = await charityContract.deploy(10);
  // 10 is the Maximum number of whitelisted addresses allowed

  // Wait for it to finish deploying
  await deployedcharityContract.deployed();

  // print the address of the deployed contract
  console.log("Deployed! Charity Contract Address:", deployedcharityContract.address);
}

// Call the main function and catch if there is any error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });