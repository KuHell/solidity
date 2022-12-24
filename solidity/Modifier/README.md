## Assert

- Error를 발생시키고 Tx로 인해 지금까지 변경된 state를 롤백, fee를 되돌려준다

```javascript
// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 < 0.9.0;

// 뒤에 에러문을 쓰지않고 조건만 체크 할때 사용
contract Assert{
  mapping(address => uint256) public orderList;
  function order() external payable {
    assert(msg.value != 0);
    orderList[msg.sender] = msg.value;
  }
}
```

## Modifier

- Tx실행 전 각 함구마다 조건을 체크해서 처리를 하는 경우가 있는데 모든 function을 처리하면 가독성이 떨어지기 때문에 require를 사용해서 체크

```javascript
// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 < 0.9.0;

contract Modifier{
  uint public minPrice = 10000;
  mapping(address => uint256) public orderList;

  modifier checkMinPrice() {
    require(msg.value > minPrice);
    _;
  }

  function test1() public payable checkMinPrice{
    orderList[msg.sender] = msg.value;
  }
}
```

- `_;` 뒤에 오는 로직을 실행

## Require

- 사용자가 실제로 조건문을 if가아닌 간단하게 예외 체크
- 조건이 충족하면 다음 함수를 실행하고
- `,` 뒤에 error일 경우 실행 할 것을 실행

```javascript
// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 < 0.9.0;

contract Require{
  mapping(address => uint256) public orderList;
  function onder() external payable {

    require(msg.value != 0, 'msg.value is must not be zero');
    orderList[msg.sender] = msg.value;
  }
}
```

## Revert

- 조건문이 없고 revert가 들어가면 err발생 state롤백

```javascript
// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 < 0.9.0;

contract Revert{
  mapping(address => uint256) public orderList;
  uint8 minPrice = 8;
  function onder() external payable {
    if(msg.value < minPrice) {
      revert('msg.value must not be zero');
    }
    orderList[msg.sender] = msg.value;
  }
}
```

## TryCath

- 다른 함수를 호출 했을때만 사용 가능

```javascript
// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 < 0.9.0;

contract Math{
  function plusData(uint a, uint b) external pure returns(uint){
    return a + b;
  }
}

contract TryCath{
  Math math = new Math();
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
```

## CustomError

```javascript
// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 < 0.9.0;

error CustomError();

contract Require{
  uint public minPrice  = 100;
  mapping(address => uint256) public orderList;
  function order() external payable {
    if(msg.value < minPrice) {
      revert CustomError();
    }
    orderList[msg.sender] = msg.value;
  }
}

```
