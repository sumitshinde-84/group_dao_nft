// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract FakeNFTMarketplace {

    mapping(uint => address) public tokens;

    uint public NftPrice = 0.1 ether;

    function purchase( uint tokenId) external payable {
       require(msg.value == NftPrice,"not enough ether to purchase");
       tokens[tokenId] = msg.sender;
    }

    function getPrice() external view returns(uint256){
        return NftPrice;
    }

    function available(uint tokenId) external view returns(bool) {
        if(tokens[tokenId]==address(0)){
            return true;
        }
        return false;
    }
}