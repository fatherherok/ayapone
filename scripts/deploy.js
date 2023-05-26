
const { ethers } = require("hardhat");
async function main() {
 
    // Deploy First
    const First = await ethers.getContractFactory('Ayatoken.sol');
    const first = await First.deploy();

    // Deploy Second
    const Second = await ethers.getContractFactory('AyaUser.sol');
    const second = await Second.deploy(first.address);

    console.log( "First: " + first.address );
    console.log( "Second: " + second.address ); 
}



main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
})