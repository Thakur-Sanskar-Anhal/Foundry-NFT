// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// imports
import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

// contracts
contract DeployMoodNftTest is Test {
// global variables
    DeployMoodNft public deployer;

// functions
    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToURI() public view{
        string memory expectedUri = "test";
        string memory svg='';
        string memory actualUri = deployer.svgToImageURI(svg);
        assert(keccak256(abi.encodePacked(actualUri)) == keccak256(abi.encodePacked(expectedUri)));
    }
}