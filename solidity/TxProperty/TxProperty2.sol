// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 < 0.9.0;

contract TxProperty2{
  // 요청을 보낸 사용자의 주소 저장
  mapping(address=> uint) private orderList;
  function newOrderList() external payable {
    orderList[msg.sender] = msg.value;
  }
  //
  bytes4 private checkFunction;
  function newCheckFunction (address sender, uint price) external returns(bool) {
    bytes selector = bytes4(keccak256('newOrderList()'));

    if(selector == msg.sig) {
      return true
    }
  }
} 