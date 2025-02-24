// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {OrcaCoin} from "../src/OrcaCoin.sol";

contract OrcaCoinTest is Test {
    OrcaCoin orcaCoin;
    address public minter = address(0x1);

    function setUp() public {
        orcaCoin = new OrcaCoin(address(this));
    }

    function testInitialSupply() public view{
        assert(orcaCoin.totalSupply() == 0);
    }

    function testFailMint() public  {
        vm.startPrank(0x587EFaEe4f308aB2795ca35A27Dff8c1dfAF9e3f);
        orcaCoin.mint(0x587EFaEe4f308aB2795ca35A27Dff8c1dfAF9e3f,10);   
        vm.stopPrank(); 
    }

    function testMint() public {
        orcaCoin.mint(0x587EFaEe4f308aB2795ca35A27Dff8c1dfAF9e3f,10);
        assert(orcaCoin.balanceOf(0x587EFaEe4f308aB2795ca35A27Dff8c1dfAF9e3f) == 10);
    }

    function testChangeStakingContract() public {
        orcaCoin.updateStakingContract(0x587EFaEe4f308aB2795ca35A27Dff8c1dfAF9e3f);
        vm.startPrank(0x587EFaEe4f308aB2795ca35A27Dff8c1dfAF9e3f);
        orcaCoin.mint(0x587EFaEe4f308aB2795ca35A27Dff8c1dfAF9e3f,10);
        assert(orcaCoin.balanceOf(0x587EFaEe4f308aB2795ca35A27Dff8c1dfAF9e3f) == 10);
    }
}
