//Contract based on [https://docs.openzeppelin.com/contracts/3.x/erc721](https://docs.openzeppelin.com/contracts/3.x/erc721)
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//To be a valid smart contract, we need to implement all methods of ERC-721 standard
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";    //counts how many NFTs we mint
import "@openzeppelin/contracts/access/Ownable.sol";    //sets access control on our NFT so we can mint our nft using smart contract
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MyNFT is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    //our constructor, first string = Smart Contract's name. 
    constructor() ERC721("MyNFT", "NFT") {}

    //this mints NFT to specified address.
    // @param recipient = address which will recieve minted NFT
    // @param memory tokenURI = string that should resolve into JSON doc that describes
    // NFT's metadata. Metadata is what allows NFT to have configurable properties (Name, description, image.jpeg, otherAttributes)
    // @returns ID of freshly minted NFT
    function mintNFT(address recipient, string memory tokenURI)
        public onlyOwner
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}
