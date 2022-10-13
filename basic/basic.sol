//SPDX-License-Identifier:GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract basic {
    uint256 test_num = 5;

    function call_num() public view returns (uint256) {
        return test_num;
    }
}
