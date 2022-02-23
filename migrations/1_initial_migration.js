const Migrations = artifacts.require("ContactStorage");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};
