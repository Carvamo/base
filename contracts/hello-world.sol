// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract HelloWorld {
    function Greeter(string memory _name) external pure returns (string memory, string memory) {
        return ("Hello", _name);
    }
}