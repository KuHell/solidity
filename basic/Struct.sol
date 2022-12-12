//SPDX-License-Identifier:GPL-3.0
pragma solidity >=0.8.0 <0.9.0;

contract Struct {
		//구조체
    struct Product {
        string name;
        uint256 price;
    }

    Product public mainProduct;
    //초기 배포할때 동작하는 함수
    //처음 배포하고 바뀌지 않는 값들
    uint256 public maxproductCount;

    constructor() {
        maxproductCount = 1000;
    }

    function initProduct() public pure {
        Product memory firstProduct;
        firstProduct = Product("toy1", 10);
    }

    function setMainProduct(string memory _name, uint256 _price) public {
        mainProduct.name = _name;
        mainProduct.price = _price;
    }

    function getMainProductPrice() public view returns (uint256) {
        return mainProduct.price;
    }
}
