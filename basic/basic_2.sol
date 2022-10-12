/*
1. 가시성 지정자
https://hunsman.tistory.com/39?category=1043081

개념
- JAVA, C# 등 언어에서 사용하는 접근 제한자와 같은 것

- 적용 대상
어떤 주체가 특정 변수나 함수에 접근하려고 할 때 먼저 정의된 가시성 지정자에 따라 접근 여부가 판가름난다
때문에, 변수와 함수를 정의할 때 필수로 명시해야한다
적용된 대상은 공개 범위가 제한될 수 있다

- 종류
public, external, private, internal
지정자에 따라서 함수나 변수의 공개 범위가 달라진다

2. 함수의 정의 방법

- 매개변수를 받지 않으면서 출력값도 없는 기본 함수

- 매개변수를 받는 함수

- 두 개 이상의 매개변수를 가진 함수

- 값을 반환하는 함수
*/

//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract basic_2{
    //  매개 변수를 받지 않으면서 출력값도 없는 기본 함수
    uint public a = 7;

    function example_1() public{
        a = 14;        
    }

    // 매개변수를 받는 함수
    function example_2(uint256 _num) public{
        a = _num;
    }

    // 두 개 이상의 매개변수를 가진 함수
    function example_3(uint256 _num1, uint256 _num2) public{   
        uint256 b = 2;
        a = _num1;
        b = _num2;
    }

    // 값을 반환하는 함수
    function example_4(uint256 _num1) public returns(uint256){
        a = _num1;
        return a;
    }
}