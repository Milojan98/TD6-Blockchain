const AnimalBattle = artifacts.require("AnimalBattle");
const AnimalOwnership = artifacts.require("AnimalOwnership");
const AnimalLand= artifacts.require("AnimalLand");
const Offspring= artifacts.require("Offspring");
const StringUtils= artifacts.require("StringUtils");
const Breeder=artifacts.require("Breeder");

module.exports = function(deployer) {
  deployer.deploy(AnimalBattle);
  deployer.deploy(AnimalOwnership);
  deployer.deploy(AnimalLand);
  deployer.deploy(Breeder);
  deployer.deploy(StringUtils);
  deployer.link(StringUtils,Offspring);
  deployer.deploy(Offspring);
};
