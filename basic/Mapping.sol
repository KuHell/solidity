//SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.0 <0.9.0;

contract Mapping {
  //ERC20 잔액관리 
  //key => value
  mapping(address => int) public balance;

  balance['0xd3bbd9d00f8Bcc5492e161AfeBf96eA785d86Edf'] = 1000;
  uint public myBalance = balance['0xd3bbd9d00f8Bcc5492e161AfeBf96eA785d86Edf']; //1000
}