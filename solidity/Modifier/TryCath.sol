// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 < 0.9.0;

contract Math{
  function plusData(uint a, uint b) external pure returns(uint){
    return a + b;
  }
}

// 다른 함수를 호출 했을때만 사용 가능
contract TryCath{
  Math math = new Math();
  // address payable temp_address = 0xd3bbd9d00f8Bcc5492e161AfeBf96eA785d86Edf;
  address payable public temp_address;
  constructor() {
      temp_address = payable(msg.sender);
  }

  function callOtherContract() external {
    try math.plusData(6, 4) returns(uint result) {
      (temp_address).transfer(result);
    }catch{
      revert(); //롤백
    }
  }
}