// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// imports
import {BasicNft} from "src/BasicNft.sol";
import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "script/DeplotBasicNft.s.sol";

// contracts
contract BasicNftTest is Test {

// global variables
    DeployBasicNft public deployer;
    BasicNft public basicNft;
    address public USER = makeAddr("user");
    string public constant PUG_URL = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";


// functions
    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

// tests
    function testNameIsCorrect() public view {
        string memory expectedName = "Dogie";
        string memory actualName = basicNft.name();
        require(
            keccak256(abi.encode(expectedName)) ==
                keccak256(abi.encode(actualName)),
            "Name is incorrect"
        );
    }

    function testCanMintAndHaveBalance() public {
        vm.prank(USER);
        basicNft.mintNft(PUG_URL);

        assert(basicNft.balanceOf(USER) == 1);
        assert(keccak256(abi.encode(basicNft.tokenURI(0))) == keccak256(abi.encode(PUG_URL)));
    }
}
