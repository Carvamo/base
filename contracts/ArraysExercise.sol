// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract ArraysExercise{
    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];
    address [] public senders;
    uint [] timestamps; 

    function getNumbers() public view returns (uint[] memory){
        return numbers;
    }

    function resetNumbers() public {
        assert(numbers.length == 10);
        numbers = [1,2,3,4,5,6,7,8,9,10];
    }

    function appenToNumbers(uint[] calldata _toAppend) public {
        for (uint i = 0; i < _toAppend.length; i++){
            numbers.push(_toAppend[i]);
        }
    }

    function saveTimestamp(uint _unixTimestamp) public {
        senders.push(msg.sender);
        timestamps.push(_unixTimestamp);
    }

    function afterY2K() public view returns (uint[] memory timestampsAfterY2K, address[] memory sendersAfterY2K){
        uint[] memory _timestampsAfterY2K = new uint[](timestamps.length);
        address[] memory _sendersAfterY2K = new address[](senders.length);
        uint counter = 0;

        for (uint i = 0; i < timestamps.length; i++){
            if (timestamps[i] > 946702800){
                _timestampsAfterY2K[counter] = timestamps[i];
                _sendersAfterY2K[counter] = senders[i];
                counter++;
            }
        }
        timestampsAfterY2K = new uint[](counter);
        sendersAfterY2K = new address[](counter);
        for (uint i = 0; i < counter; i++){
            timestampsAfterY2K[i] = _timestampsAfterY2K[i];
            sendersAfterY2K[i] = _sendersAfterY2K[i];
        }
    }

    function resetSenders() public {
        delete senders;
    }

    function resetTimestamps() public {
        delete timestamps;
    }
}