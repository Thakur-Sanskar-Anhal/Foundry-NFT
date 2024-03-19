// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// imports
import {BasicNft} from "src/BasicNft.sol";
import {Script} from "forge-std/Script.sol";

// contract
contract DeployBasicNft is Script {
    
// global variables

// functions
    function run() external returns (BasicNft) {
        vm.startBroadcast();
        BasicNft basicNft = new BasicNft();
        vm.stopBroadcast();
        return basicNft;
    }
}
