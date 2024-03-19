// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// imports
import {BasicNft} from "src/BasicNft.sol";
import {Script} from "forge-std/Script.sol";
import {DevopsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "src/BasicNft.sol";

// contract
contract Interactions is Script {

// global variables
    string public constant PUG_URL =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

// functions
    function run() external returns (BasicNft) {
        address mostRecentlyDeployed = DevOpsTools.get_most_recently_deployed(
            "BasicNft",
            block.chainid
        );
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(PUG_URL);
        vm.stopBroadcast();
    }
}
