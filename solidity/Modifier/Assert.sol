// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 < 0.9.0;

// 뒤에 에러문을 쓰지않고 조건만 체크 할때 사용
contract Assert{
  mapping(address => uint256) public orderList;
  function order() external payable {
    assert(msg.value != 0); //Error를 발생시키고 Tx로 인해 지금까지 변경된 state를 롤백 fee를 되돌려준다
    orderList[msg.sender] = msg.value;
  }
}

