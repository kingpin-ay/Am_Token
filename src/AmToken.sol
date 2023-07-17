// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract AmToken is ERC721 {
    uint256 private s_tokenId;
    mapping(uint256 => string) private s_tokenIdToTokenUri;

    constructor() ERC721("AmToken", "AMT") {
        s_tokenId = 0;
    }

    function mint(string memory tokenUri) public {
        s_tokenIdToTokenUri[s_tokenId] = tokenUri;
        _safeMint(msg.sender, s_tokenId);
        s_tokenId++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return s_tokenIdToTokenUri[tokenId];
    }
}
