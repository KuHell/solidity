// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 < 0.9.0;

contract blockProperty{
  uint public block1 = block.basefee; // 린크비 테스트넷 : 24
  uint public block2 = block.chainid; //린크비 체인 아이디 : 4
  address payable public block3 = block.coinbase; //코인베이스 주소
  uint public block4 = block.difficulty; //난의도
  uint public block5 = block.gaslimit; //가스리밋 3천만
  uint public block6 = block.number; //블록의 넘버 blockNumber
  uint public block7 = block.timestamp; // 시간 
} 