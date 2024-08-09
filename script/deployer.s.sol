// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
// import your contracts here
import {Bank} from "../src/Bank.sol";

contract MyTokenScript is Script {

    Bank public bank;

    function setUp() public {}

    function run() public {

        
        vm.startBroadcast();

        // deploy your contracts here

        bank = new Bank();


        console.log("MyToken deployed to:", address(bank));

        vm.stopBroadcast();
    }
}

