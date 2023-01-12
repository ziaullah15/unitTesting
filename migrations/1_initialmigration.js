// const marketPlace = artifacts.require("marketPlace");
// const MyNFT = artifacts.require("MyNFT");
// const ERC20 = artifacts.require("ERC20");
const MyToken = artifacts.require("MyToken");
// const provideaddress = '0xc4dCB5126a3AfEd129BC3668Ea19285A9f56D15D';
// const Market = artifacts.require("Market");
module.exports = function (deployer) {
  // deployer.deploy(marketPlace);
  // deployer.deploy(MyNFT);
  // deployer.deploy(ERC20);
//   deployer.deploy(FlashLoan);
  deployer.deploy(MyToken);
  // deployer.deploy(Market);
};