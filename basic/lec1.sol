//SPDX-License-Identifier:GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract lec2 { 
    bool public b = false;

    // ! || ++ &&
    bool public b1 = !false;
    bool public b2 = false || true;
    bool public b3 = false == true;
    bool public b4 = false && true;

    bytes4 public bt = 0x12345678;
    bytes public bt2 = "Strgin";

    address public addr = 0xDA0bab807633f07f013f94DD0E6A4F96F8742B53;

    int8 public it = 4;
    //uint == uint256;
    uint256 public uit = 123123;
}