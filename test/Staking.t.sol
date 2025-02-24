// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/StakingContract.sol";

contract StakingContractTest is Test {
    StakingContract stakingContract;

    function setUp() public {
        stakingContract = new StakingContract();
    }

    function testStake() public {
        stakingContract.stake{value: 200}();
        assert(stakingContract.balanceOf(address(this)) == 200);
    }

    function testStakeUser() public {
        vm.startPrank(0x8d0C05dfbD1824fD35964CFb34C2DCa1a434988E);
        vm.deal(0x8d0C05dfbD1824fD35964CFb34C2DCa1a434988E, 10 ether);
        stakingContract.stake{value: 1 ether}();
        assert(stakingContract.balanceOf(0x8d0C05dfbD1824fD35964CFb34C2DCa1a434988E) == 1 ether);
    }

    function testUnstake() public {
        stakingContract.stake{value: 200}();
        stakingContract.unstake(100);
        assert(stakingContract.balanceOf(address(this)) == 100);
    }

    function testFailUnstake() public {
        stakingContract.stake{value: 200}();
        stakingContract.unstake(300);
    }

}