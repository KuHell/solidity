# ifElse.sol

- 비즈니스 로직 중에서 실제로 실행이 되야되는지 아되어야 되는지 확인하기 위해 사용된다

## revert()

- 실패 처리

## continue

```
if(i == 5) {
  continue;
}
```

- i 가 5일때는 제외를 하고 진행

## blockproperty

```
  uint public block1 = block.basefee; // 린크비 테스트넷 : 24
  uint public block2 = block.chainid; //린크비 체인 아이디 : 4
  address payable public block3 = block.coinbase; //코인베이스 주소
  uint public block4 = block.difficulty; //난의도
  uint public block5 = block.gaslimit; //가스리밋 3천만
  uint public block6 = block.number; //블록의 넘버 blockNumber
  uint public block7 = block.timestamp; // 시간
```

### keccak256

- 해쉬 알고리즘을 사용하고 싶으면 스마트 컨트랙트의 내장되어있는 해쉬 알고리즘 keccak256

- 실제값이 string이 아닌 byte값으로 넣어줘야돼서 `abi.encodePacked()`를 통해서 쓸 수 있다.

- 가장 많이 쓰는 데이터
  `block.timestamp`
  `block.difficulty`

`abi.encodePacked(block.timestamp, block.difficulty)`
