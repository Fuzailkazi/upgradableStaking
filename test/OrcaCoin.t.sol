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
        vm.startPrank(0x8d0C05dfbD1824fD35964CFb34C2DCa1a434988E);
        orcaCoin.mint(0x8d0C05dfbD1824fD35964CFb34C2DCa1a434988E,10);   
        vm.stopPrank(); 
    }

    function testMint() public {
        orcaCoin.mint(0x8d0C05dfbD1824fD35964CFb34C2DCa1a434988E,10);
        assert(orcaCoin.balanceOf(0x8d0C05dfbD1824fD35964CFb34C2DCa1a434988E) == 10);
    }

    function testChangeStakingContract() public {
        orcaCoin.updateStakingContract(0x8d0C05dfbD1824fD35964CFb34C2DCa1a434988E);
        vm.startPrank(0x8d0C05dfbD1824fD35964CFb34C2DCa1a434988E);
        orcaCoin.mint(0x8d0C05dfbD1824fD35964CFb34C2DCa1a434988E,10);
        assert(orcaCoin.balanceOf(0x8d0C05dfbD1824fD35964CFb34C2DCa1a434988E) == 10);
    }
}
