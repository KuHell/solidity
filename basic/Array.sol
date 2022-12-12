//SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.0 <0.9.0;

contract Array {
  //int[]배열안에 얼마나 값이 들어간지 모를때
  uint8[] public intList = [1,2,3,4];
  // 배열안에 3개
  uint8[3] public int3List = [1,2,3];

  intList.push(5)
  uint8 public lastData = intList.pop()  // 5
  uint8 public secondData = intList[1];  //2

  //배열제거 0으로 초기화
  delete intList[1] // [1, 0, 3, 4]

  struct Product {
    string name;
    uint8 price;
  }

  Product[] public productList;
  productList.push(mainProduct);
}