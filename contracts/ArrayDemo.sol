// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract ArrayDemo{
    uint[] public numbers;
    uint public numEven;

    function getEvenNumbers() external view returns (uint [] memory){
        uint resultsLength = numEven;
        uint [] memory results = new uint[](resultsLength);
        uint cursor = 0;

         for (uint i = 0; i < numbers.length; i++){
            if (numbers[i] % 2 == 0){
                results[cursor] = numbers[i];
                cursor++;
            }
         }
         return results;
    }

    function _countEvenNumbers() internal view returns (uint){
        uint result = 0;
        for (uint i = 0; i < numbers.length; i++){
            if (numbers[i] % 2 == 0){
                result++;

            }
        }
        return result;
    }

    function debugLoadArray(uint _number) external{
        for (uint i = 0; i < _number; i++){
            numbers.push(i);
            //if (i % 2 == 0){
              //  numEven++;
            //}
        }
    }
}