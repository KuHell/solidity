//SPDX-License-Identifier:GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract basic {
    uint8 test_num = 6;

    function call_num() public view returns (uint8) {
        return test_num;
    }
}
