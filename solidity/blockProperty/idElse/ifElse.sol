// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 < 0.9.0;

contract ifElse {
  uint public mininalprice = 1000;
  mapping(int=> address) public owner;
  function conditional(uint ask_price) public {
    if(ask_price > mininalprice) {
      owner[1] = msg.sender;
    }else {
      //fail
      //revert()
    }
  }

  function dowhile() public{
    uint8 sum = 0;
    uint8 i = 1;
    do{
      sum += 1;
      i ++;
    }while(i<11)
  }

}