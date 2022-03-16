require("dotenv").config()
const API_URL = process.env.API_URL
const { createAlchemyWeb3 } = require("@alch/alchemy-web3")
const web3 = createAlchemyWeb3(API_URL)
//parses contract ABI (Application Binary Interface) -> the interface to interact with our smart contract. 
const contract = require("../artifacts/contracts/MyNFT.sol/MyNFT.json")

//this prints ABI to console if we want to see it 
console.log(JSON.stringify(contract.abi))


//TODO -> this is how to run this file to check ABI:
// node scripts/mint-nft.js