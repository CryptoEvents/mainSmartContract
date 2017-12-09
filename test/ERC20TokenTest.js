const web3 = global.web3;

const ERC20Token = artifacts.require("./ERC20Token.sol");
const SmartContract = artifacts.require("./mainSmartContract.sol");

contract('ERC20Token', function(accounts) {
    it("init token", async function() {
        let token = await ERC20Token.new(accounts[0],'test','tst',18);
        console.log(token);

    });

    it("init token without owner should fail", async function() {

        try {
            let token = await ERC20Token.new();
            assert(false);
        } catch (e){
            assert(true);
        }

    });

    it("should allow only owner to transfer token", async function() {
        //todo mint account[0]
        //todo transfer  to account[1]
        //todo try transfer from another user account[1] to account[2]

    });

    

});

contract('mainSmartContract', function([_, investor, wallet, purchaser]) {
    it("init smartContract", async function() {
        let contract = await SmartContract.new(5*10**17);
	console.log(contract);
    });
    it("create smartContract without fees", async function() {

        try {
            let contract = await SmartContract.new();
            assert(false);
        } catch (e){
            assert(true);
        }

    });

    it("deploy new eventContract", async function() {
        let contract = await SmartContract.new(5*10**17);
        const amount = web3.toWei(0.5, 'ether');
        contract.deployNew('Test','TST',18,{ value: amount, from: purchaser });
        
    });
    it("get token eventContract", async function() {
        let contract = await SmartContract.new(5*10**17);
        cnt = contract.getContract('Test');
        console.log(cnt);
    });
    
});
