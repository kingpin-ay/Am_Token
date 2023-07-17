// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {AmToken} from "../src/AmToken.sol";

contract DeployAmToken is Script {
        AmToken amToken;
    function run() external returns (AmToken) {
        vm.startBroadcast();
        amToken = new AmToken();
        vm.stopBroadcast();
        return amToken;
    }
}
