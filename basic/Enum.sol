//SPDX-License-Identifier:GPL-3.0
pragma solidity >=0.8.0 <0.9.0;

contract Enum {
  enum Status {
    NotSale,
    Auction,
    Sales,
    Bid,
    Sold
  }
  Status public auctionsStatus;

  function auctionStart() public {
    auctionsStatus = Status.Auction;
  }

  function bid() public {
    auctionsStatus = Status.Bid;
  }

  function sold() public {
    auctionsStatus = Status.Sold;
  }
}