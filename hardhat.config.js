// const { ethers } = require('ethers')

// require("dotenv").config()

require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-ethers");


const RPC_URL = process.env.RPC_URL
const PRIVATE_KEY = process.env.PRIVATE_KEY
module.exports = {
     defaultNetwork: "goerli",
    networks: {
        goerli: {
          url: RPC_URL,
          accounts: [PRIVATE_KEY]
        }
    },

  solidity: "0.8.18",
};
