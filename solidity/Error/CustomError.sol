// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 < 0.9.0;

error CustomError();

contract Require{
  uint public minPrice  = 100;
  mapping(address => uint256) public orderList;
  function order() external payable {
    if(msg.value < minPrice) {
      revert CustomError();
    }
    orderList[msg.sender] = msg.value;
  }
}
