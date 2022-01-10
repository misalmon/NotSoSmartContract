// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VoiceprintSafe {
        
    mapping(address => mapping(string => bytes)) public voiceprints;

    event LogNewCert(address sender, string voiceprintTag);
    event CertResult(bytes cert);

    function createCert(string memory vpTag, bytes calldata _cert) public returns(bool completed){        
        require(msg.sender != address(0));
        require(_cert.length != 0);                     
        voiceprints[msg.sender][vpTag] = _cert;
        emit LogNewCert(msg.sender, vpTag);        
        return true;
    }

    function getCert(address owner, string calldata vpTag) public returns(bytes memory){ 
        emit CertResult(voiceprints[owner][vpTag]);
        return voiceprints[owner][vpTag];
    }
    
}
