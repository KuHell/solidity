// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 < 0.9.0;

contract Modifier{
  //Tx실행 전 각 함수마다 조건을 체크해서 처리를 하는 경우가 있는데 
  // 모든 function을 처리하면 가독성이 떨어지기 때문에 require를 사용해서 체크
  modifier checkMinPrice() {
    require(msg.value > minPrice);
    _;
  }

  uint public minPrice = 10000;
  mapping(address => uint256) public orderList;
  function test1() public payable checkMinPrice{
    orderList[msg.sender] = msg.value;
    //로직 처리~~
  }
} 