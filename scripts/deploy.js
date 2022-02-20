const hre = require("hardhat");

async function main(){
    const [owner] =  await hre.ethers.getSigners();
    const BankContractFactory = await hre.ethers.getContractFactory("BankContract");
    const BankContract = await BankContractFactory.deploy();
    await BankContract.deployed();

    console.log("bank Contract deployed to", BankContract.address);
    console.log("Bank Contract owners address", owner.address);
}

main()
    .then(()=> process.exit(0))
    .catch((error)=> {
        console.log(error);
        process.exit(1);
    });
// 0xeD54606f329229A604448e4C327E993E8Bd796b2