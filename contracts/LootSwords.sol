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

    function greatnessToColor(int256 x) internal pure returns (string memory) {
        if (x < 14) {
            return "#cfd1d2";
        } else if (x <= 19) {
            return "#02a2f1";
        } else {
            return "#f8b642";
        }
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override
        returns (string memory)
    {
        string[3] memory parts;
        parts[
            0
        ] = '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350"><path d="M139 280l-1.241-10.217c-1.242-10.218-3.725-30.652-8.654-51.087-4.929-20.434-12.303-40.869-15.99-51.086l-3.688-10.218 2.39-6.454c2.39-6.454 7.168-19.362 9.502-32.27 2.333-12.909 2.22-25.817 2.164-32.271l-.056-6.455 9.678 7.825c9.678 7.824 29.033 23.472 35.296 56.815 6.262 33.343-.57 84.38-3.985 109.9L161 280" fill="';
        parts[1] = greatnessToColor(19);
        parts[
            2
        ] = '"/> <path d="M123.427 79.942l8.696 9.152c8.696 9.15 26.087 27.453 32.35 60.796 6.262 33.343 1.394 81.727-1.04 105.918L161 280" fill="none" stroke="#e2e3e4" stroke-width="6" /> <path d="M139 280l-1.241-10.217c-1.242-10.218-3.725-30.652-8.654-51.087-4.929-20.434-12.303-40.869-15.99-51.086l-3.688-10.218h0l2.39-6.454c2.39-6.454 7.168-19.362 9.502-32.27 2.333-12.909 2.22-25.817 2.164-32.271l-.056-6.455h0l9.678 7.825c9.678 7.824 29.033 23.472 35.296 56.815 6.262 33.343-.57 84.38-3.985 109.9L161 280" fill="none" stroke="#a0a3a5" stroke-width="3" /> <path d="M137 280a13 13 0 1126 0h-13z" fill="#775953" stroke="#3b291e" stroke-width="3" /> <defs> <pattern id="prefix__a" patternUnits="userSpaceOnUse" width="7" height="7"> <path fill="#a09277" d="M0 0h7v7H0z" /> <circle cx="3.5" cy="3.5" r="2.5" fill="#776b53" stroke="#343434" stroke-width="0" /> </pattern> </defs> <path d="M139 290h22l-5 32h-12z" fill="url(#prefix__a)" stroke="#3b291e" stroke-width="3" /> <path d="M175.5 280c1.77.23 4.77 9.77 3.5 10-1.27.23-56.73.23-58 0-1.27-.23 1.73-9.77 3-10 1.27-.23 50.73-.23 52 0" fill="#776b53" stroke="#3b291e" stroke-width="3" /> <circle cx="150" cy="322" r="11" fill="#776b53" stroke="#3b291e" stroke-width="3" /> <circle cx="150" cy="322" r="5.5" fill="#eee58b" stroke="#3b291e" stroke-width="3" /> </svg>';

        string memory output = string(
            abi.encodePacked(parts[0], parts[1], parts[2])
        );

        console.log(string(abi.encodePacked(parts[0], parts[1], parts[2])));

        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "Bag #',
                        toString(tokenId),
                        '", "description": "Loot is randomized adventurer gear generated and stored on chain. Stats, images, and other functionality are intentionally omitted for others to interpret. Feel free to use Loot in any way you want.", "image": "data:image/svg+xml;base64,',
                        Base64.encode(bytes(output)),
                        '"}'
                    )
                )
            )
        );
        output = string(
            abi.encodePacked("data:application/json;base64,", json)
        );

        return output;
    }

    constructor() ERC721("LootSwords", "LSWORD") Ownable() {}

    function toString(uint256 value) internal pure returns (string memory) {
        // Inspired by OraclizeAPI's implementation - MIT license
        // https://github.com/oraclize/ethereum-api/blob/b42146b063c7d6ee1358846c198246239e9360e8/oraclizeAPI_0.4.25.sol

        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
}
