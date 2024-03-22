// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {MyNFT} from "../src/NFT.sol";

contract ContractTest is Test {
    MyNFT public nft;
    address private bob = address(0x1);
    address private mary = address(0x2);
// All parameters set up in the setUp function apply for all testXXXX functions
// test should start with "test"
    function setUp() public {
        nft = new MyNFT();
        nft.mint(bob,0);
    }

    function testSetUp() public {
        address owner = nft.ownerOf(0);
        assertEq(owner, bob);
        emit log_string("NFT owned by bob"); 
    }

    function testTransfer() public {
        vm.startPrank(bob);
        nft.safeTransferFrom(bob, mary, 0);
        address owner = nft.ownerOf(0);
        assertEq(owner, mary);
        emit log_string("New Owner of NFT is Mary"); 
        emit log_named_address("Address owner of NFT 0 is",nft.ownerOf(0));
    }

    function testWrongTransfer() public {
        vm.startPrank(mary);
        vm.expectRevert("not authorized");
        nft.safeTransferFrom(bob, mary, 0);
    }

    function testBalance() public {
        nft.mint(bob,1);
        nft.mint(bob,2);
        nft.mint(bob,3);
        nft.mint(bob,4);
        nft.mint(mary,5);
        uint maryOwned =  nft.balanceOf(mary);
        uint bobOwned = nft.balanceOf(bob);
        assertEq(bobOwned, 5);
        assertEq(maryOwned, 1);
        emit log_named_uint("Total amount of NFTs is", nft.balanceOf(bob)+nft.balanceOf(mary));
    }

    function testOwnerBurn() public {
        vm.startPrank(mary);
        vm.expectRevert("not owner");
        nft.burn(0);

    }

}
