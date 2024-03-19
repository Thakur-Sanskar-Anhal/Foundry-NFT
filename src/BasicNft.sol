// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// imports
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// contracts
contract BasicNft is ERC721 {

// global variables
    uint256 private s_tokenCounter;
    mapping (uint256 => string) private s_tokenIdToUri;

// constructor
    constructor() ERC721("Dogie", "DOG") {
        s_tokenCounter = 0;
    }

// functions
    function mintNft(string memory tokenUri) public{
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns(string memory){
        return s_tokenIdToUri[tokenId];
    }

}
