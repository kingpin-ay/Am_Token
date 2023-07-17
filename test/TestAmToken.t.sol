// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployAmToken} from "../script/DeployAmToken.s.sol";
import {AmToken} from "../src/AmToken.sol";

contract TestAmToken is Test {
    DeployAmToken public deployAmToken;
    AmToken public amToken;
    address private s_alice = makeAddr("alice");
    uint256 private constant STARTING_BUDGET = 10 ether;

    function setUp() public {
        deployAmToken = new DeployAmToken();
        amToken = deployAmToken.run();
        vm.deal(s_alice, STARTING_BUDGET);
    }

    function testMint() public {
        vm.prank(s_alice);
        amToken.mint("https://example.com/");
        assertEq(amToken.balanceOf(s_alice), 1);
    }

    function testTokenUri() public {
        vm.prank(s_alice);
        amToken.mint("https://example.com/alice");
        string memory tokenUri = amToken.tokenURI(0);
        assertEq(keccak256(abi.encodePacked(tokenUri)), keccak256(abi.encodePacked("https://example.com/alice")));
    }
}


/**
 * SEPOLIA TEST NET
 * TestAmToken:testMint() (gas: 104088)
 * TestAmToken:testTokenUri() (gas: 105764)
  Gas Cost: 209,852
  All contracts deployed to: 0x5FbDB2315678afecb367f032d93F642f64180aa3
  ✓ TestAmToken:testMint() (gas: 104088) (73ms)
  ✓ TestAmToken:testTokenUri() (gas: 105764) (73ms)
 */