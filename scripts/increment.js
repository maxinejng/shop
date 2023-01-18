/*
  Try `truffle exec scripts/increment.js`, you should `truffle migrate` first.

  Learn more about Truffle external scripts: 
  https://trufflesuite.com/docs/truffle/getting-started/writing-external-scripts
*/

const Shop = artifacts.require("Shop");

module.exports = async function (callback) {
  const deployed = await Shop.deployed();

  const currentValue = (await deployed.read()).toNumber();
  console.log(`Current Shop value: ${currentValue}`);

  const { tx } = await deployed.write(currentValue + 1);
  console.log(`Confirmed transaction ${tx}`);

  const updatedValue = (await deployed.read()).toNumber();
  console.log(`Updated Shop value: ${updatedValue}`);

  callback();
};
