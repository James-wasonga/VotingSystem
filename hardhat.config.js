require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",
  networks: {
    lisk: {
      url: "https://lb.drpc.org/ogrpc?network=lisk-sepolia&dkey=AjfutDTjsEJGsNxxkMradwpq2IkHJO0R8IH-EjfP07KJ",
      accounts: [process.env.PRIVATE_KEY], 
      gasPrice: 1000000000,
    },
  },
}; 