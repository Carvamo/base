// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract Mappings {
    mapping (address => uint) public favoriteNumbers;
    address[] addressesOfFavs;

    function saveFavoriteNumber(uint _favorite) public {
        if (favoriteNumbers[msg.sender] == 0){
        addressesOfFavs.push(msg.sender);
        }
        favoriteNumbers[msg.sender] = _favorite;
    }

    function returnAllFavorites() public view returns (uint[] memory){
        uint[] memory allFavorites = new uint[](addressesOfFavs.length);

        for (uint i = 0; i < allFavorites.length; i++){
            allFavorites[i] = favoriteNumbers[addressesOfFavs[i]];
        }
        return allFavorites;
    }
}