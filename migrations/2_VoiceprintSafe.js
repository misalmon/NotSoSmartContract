const VoiceprintSafe = artifacts.require("VoiceprintSafe");

module.exports = async function (deployer) {
  await deployer.deploy(VoiceprintSafe);
};