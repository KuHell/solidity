// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC721{
  string private _name;
  string private _symbol;
  uint private totalSupply = 100000;

  mapping(uint256 => uint) private _tokenInfo;
  mapping(uint256 => address) private _owners;
  mapping(address => uint256) private _balances;
  mapping(uint256 => address) private _tokenApprovals;
  mapping(address => mapping(address => bool)) private _operatorApprovals;

  event Transfer(address from, address to, uint tokenId);
  event Approval(address from, address to, uint tokenId);
  //erc721은 대부분 교환이 외부 컨트랙트로 이루어 진다 특정 주소가 아닌 누구에게나 옮길수 있도록 권한이 필요해서
  event ApprovalForAll(address from, address operator, bool approval);

  constructor(string memory name_, string memory symbol_) {
    _name = name_;
    _symbol = symbol_;
  }

  //사용자의 잔액
  function balanceOf(address owner) public view returns(uint256) {
    return _balances[owner];
  }

  // 토큰 id의 소유자
  function ownerOf(uint256 tokenId) public view returns(address) {
    return _owners[tokenId];
  }

  function name() public view returns(string memory) {
    return _name;
  }

  function symbol() public view returns(string memory) {
    return _symbol;
  }

  //토큰의 실제 이미지가 어디에 있는지 정보를 가지고오는 함수
  function tokenURI(uint256 tokenId) public view returns(uint) {
    return _tokenInfo[tokenId];
  }

  // 어떤 주소의 네트워크 이동 권할을 줬는지 표시
  function getApproved(uint256 tokenId) public view returns(address) {
    return _tokenApprovals[tokenId];
  }

   //특정 주소가 어떤 소유자에게 권한을 넘겨 주었는지 아닌지
  function isApprovedForAll(address owner, address operator) public view returns(bool) {
    return _operatorApprovals[owner][operator];
  }

  //거래소에서 거래가 완료 되었을때 전송
  function transferFrom(address from, address to, uint256 tokenId) public {
    address owner = _owners[tokenId];
    require(msg.sender == owner, 'Not Approved');
    require(isApprovedForAll(owner, msg.sender));
    require(getApproved(tokenId) == msg.sender);
    delete _tokenApprovals[tokenId];
    _balances[from] -= 1;
    _balances[to] += 1;
    _owners[tokenId] = to;

    emit Transfer(from, to ,tokenId);
  }

  // 토큰 발행
  function mint(address to, uint256 tokenId) public {
    _balances[to] += 1;
    _owners[tokenId] = to;
    _tokenInfo[tokenId] = randomNFT(totalSupply);
    emit Transfer(address(0), to, tokenId);
  }

  function randomNFT(uint maxValue) internal returns(uint) {
    return uint(keccak256(abi.encodePacked(msg.sender, block.timestamp, totalSupply))) % maxValue;
  }

  function burn(uint256 tokenId) public {
    address owner = _owners[tokenId];
    delete _tokenApprovals[tokenId];
    _balances[owner] -= 1;
    delete _owners[tokenId];
    emit Transfer(owner, address(0), tokenId);
  }

  function transfer(address to, uint256 tokenId) public {
    require(_owners[tokenId] == msg.sender, 'Incorrect Owner');
    delete _tokenApprovals[tokenId];
    _balances[msg.sender] -= 1;
    _balances[to] += 1;
    _owners[tokenId] = to;
    emit Transfer(msg.sender, to, tokenId);
  }

  function approve(address to, uint256 tokenId) public {
    require(_owners[tokenId] == msg.sender, 'Incorrect Owner');
    _tokenApprovals[tokenId] = to;
    emit Approval(_owners[tokenId], to, tokenId);
  }

  function setApprovalForAll(address owner, address operator, bool approved) public {
    _operatorApprovals[owner][operator] = approved;
    emit ApprovalForAll(owner, operator, approved);
  }
}