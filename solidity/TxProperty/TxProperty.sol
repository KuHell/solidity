// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 < 0.9.0;

contract TxProperty{
  uint public msg1 = gasleft(); // 실핼하고 남은 가스의 값
  bytes public msg2 = msg.data;
  address public msg3 = msg.sender; // tx요청한 사람의 정보
  bytes4 public msg4 = msg.sig; //함수를 호출한 값을 byte코드로 바꾼 값
  uint public msg5 = msg.value; //사용자가 전송한 이더리움의 크기

  //시행 오류 코드
  // function checkValue() external {
  //   uint value = msg.value;
  // }
  
  //실행 가능 코드
  function checkvalueT() external payable {
    uint value = msg.value;
  }

  
} 