// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 < 0.9.0;

// 사용자가 실제로 조건문을 if가아닌 간단하게 예외 체크
contract Require{
  mapping(address => uint256) public orderList;
  function onder() external payable {
    //조건이 충족하면 다음 함수를 실행하고 
    //`,` 뒤에 error일 경우 실행 할 것을 실행
    require(msg.value != 0, 'msg.value is must not be zero');
    orderList[msg.sender] = msg.value;
  }
}