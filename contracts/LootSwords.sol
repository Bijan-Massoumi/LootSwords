//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "hardhat/console.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./Base64.sol";

interface Loot {
    function ownerOf(uint256 tokenId) external view returns (address);
}

contract LootSwords is ERC721Enumerable, Ownable {
    uint256 public mintingFee = 20000000000000000;
    uint256 public totalMintsSupply = 0;
    address public lootContractAddress =
        0xFF9C1b15B16263C61d017ee9F65C50e4AE0113D7;
    uint256 internal nonce = 0;
    Loot internal lootContract = Loot(lootContractAddress);

    function mintWithLoot(uint256 tokenId) external payable {
        require(tokenId > 0 && tokenId < 8001, "Token ID invalid");
        require(
            lootContract.ownerOf(tokenId) == _msgSender(),
            "Does not own loot"
        );

        require(mintingFee <= msg.value, "Not Enough Ether Required To Mint");
        _safeMint(_msgSender(), tokenId);
    }

    constructor() ERC721("LootSwords", "LSWORD") Ownable() {}
}
