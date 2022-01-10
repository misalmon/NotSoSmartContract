const voiceprintSafe = artifacts.require("VoiceprintSafe");

contract("VoiceprintSafeTest", function (accounts) {        
          
        it("test full cycle", async function() {
            
                let safe = await voiceprintSafe.new();                
                let tag = 'tag1';
                let myHash = web3.utils.fromAscii("20160528");
                console.log("saving hash");
                let res = await safe.createCert(tag, myHash);                
                console.log("reading hash");
                let hashRes = await safe.getCert.call(accounts[0], tag);                
                assert.equal(myHash, hashRes, "hashes are different");            
                console.log("hashes are equal");
        });
    });
