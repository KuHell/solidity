//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "contracts/access/Ownable.sol";

contract NFT is ERC721Enumerable, Ownable {
    using Strings for uint256;

    string public baseURI;
    string public baseExtension = ".json";
    uint256 public cost = 0.05 ether;
    uint256 public maxSupply = 45;
    uint256 public maxMintAmount = 1;
    bool public paused = false;

    mapping (uint256 => uint256) public tokenMetadataNo;

    event result(uint256 tokenId, uint256 randomNum, bool success);

    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol){}

    // internal
    function _baseURI() internal view virtual override returns (string memory) 
    {
        return "ipfs://QmUsjyVGzbSSrtdPYNFa61KAxDhrCV4ZgPqJbaVDWkcUXg/";
    }

    // public
    function mint(address _to, uint256 _mintAmount) public payable returns(string memory)
    {
        uint256 supply = totalSupply();
        require(!paused, "minting is disabled");
        require(_mintAmount > 0, "you have to mint more than 1");
        require(_mintAmount <= maxMintAmount, "you can't mint more than maxAmount");
        require(supply + _mintAmount <= maxSupply, "every NFTs are already minted");
        require(msg.value >= cost * _mintAmount, "you have to pay exact cost");
        
        uint256 randomNumber = getRandomNumber(_to, maxSupply);
        uint256 tokenId = supply + _mintAmount;
        tokenMetadataNo[tokenId] = randomNumber;
        _safeMint(_to, tokenId);
        emit result(tokenId, randomNumber, true);
    }

    function walletOfOwner(address _owner) public view returns (uint256[] memory)
    {
        uint256 ownerTokenCount = balanceOf(_owner);
        uint256[] memory tokenIds = new uint256[](ownerTokenCount);

        for (uint256 i; i < ownerTokenCount; i++) 
        {
            tokenIds[i] = tokenOfOwnerByIndex(_owner, i);
        }
        return tokenIds;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory)
    {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

        string memory currentBaseURI = _baseURI();
        return bytes(currentBaseURI).length > 0 ? string(abi.encodePacked(currentBaseURI, tokenMetadataNo[tokenId].toString(),baseExtension)) : "";
    }

    function getRandomNumber(address _to, uint _range) internal returns (uint256)
    {
        uint256 randomNum = uint256(
            keccak256(
                abi.encode(
                    _to,
                    tx.gasprice,
                    block.number,
                    block.timestamp,
                    block.difficulty,
                    blockhash(block.number - 1),
                    address(this),
                    _range
                )
            )
        );
        uint256 randomNumber = 1 + randomNum % _range;
        return randomNumber;
    }

    //only owner
    function setCost(uint256 _newCost) public onlyOwner 
    {
        cost = _newCost;
    }

    function setmaxMintAmount(uint256 _newmaxMintAmount) public onlyOwner 
    {
        maxMintAmount = _newmaxMintAmount;
    }

    function setBaseURI(string memory _newBaseURI) public onlyOwner 
    {
        baseURI = _newBaseURI;
    }

    function setBaseExtension(string memory _newBaseExtension) public onlyOwner
    {
        baseExtension = _newBaseExtension;
    }

    function pause(bool _state) public onlyOwner 
    {
        paused = _state;
    }

    function withdraw() public payable onlyOwner 
    {
        (bool success, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(success);
    }

}
