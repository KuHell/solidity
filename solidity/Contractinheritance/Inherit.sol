// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 < 0.9.0;

contract Car{
  string public type_;
  uint8 public door;
  uint8 public boor;

  //배보할떄 딱 한번 실행
  constructor(string memory _type, uint8 _door) {
    type_ = _type;
    door = _door;
  }

  function getDoor() public view returns(uint8) {
    return door;
  }
}

//is로 상속 가능
contract Bnez is Car('suv', 4){
  string public model;
  address public owner;

  constructor(string memory _model) {
    model = _model;
    owner = msg.sender;
  }

  function getModel() public view returns(string memory) {
    return model;
  }
}

