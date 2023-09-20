// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "https://github.com/chiru-labs/ERC721A/blob/main/contracts/ERC721A.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract erc721a is ERC721A, Ownable {

    constructor() ERC721A("ERC721A", "721A") {}

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmSNQXiatrnDkpP7g3D2H2cAwa7Hu31yP62mRwJrhLJeuD/";
    }

    function Mint(uint n) public onlyOwner 
    {
        _safeMint(msg.sender,n);
    }
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        if (!_exists(tokenId)) _revert(URIQueryForNonexistentToken.selector);

        string memory baseURI = _baseURI();
        return bytes(baseURI).length != 0 ? string(abi.encodePacked(_baseURI(), _toString(tokenId),".json")):'';
    }
}
