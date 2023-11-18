// SPDX-License-Identifier: UNLICENSED 
pragma solidity ^0.8.9;

contract Seller {
  address public seller;

  event SellerTransferred(address indexed previousSeller, address indexed newSeller);

  constructor() {
    seller = msg.sender;
  }

  modifier onlySeller() {
    require(msg.sender == seller);
    _;
  }

  function transferSeller(address newSeller) public onlySeller {
    require(newSeller != address(0));
    emit SellerTransferred(seller, newSeller);
    seller = newSeller;
  }
}