// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract BasicMath{
    function adder(uint _a, uint _b) external pure returns (uint sum, bool error){
        if (_a > type(uint).max - _b){
          return (0, true);  
        }else{
            return (_a + _b, false);
        }
    }

    function subtractor (uint _a, uint _b) external pure returns (uint difference, bool error){
        if (_a < _b){
            return (0, true);
        } else {
            return (_a - _b, false);
        }
    }
}