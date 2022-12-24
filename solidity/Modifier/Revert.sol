// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 < 0.9.0;

// 조건문이 없고 revert가 들어가면 err발생 state 롤백
contract Revert{
  mapping(address => uint256) public orderList;
  uint8 minPrice = 8;
  function onder() external payable {
    if(msg.value < minPrice) {
      revert('msg.value must not be zero');
    }
    orderList[msg.sender] = msg.value;
  }
}