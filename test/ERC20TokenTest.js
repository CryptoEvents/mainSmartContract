const ERC20Token = artifacts.require("./ERC20Token.sol");
contract('ERC20Token', function(accounts) {
    it("init token", async function() {
        let token = await ERC20Token.new(accounts[0]);
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
