// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract Structs {
    struct Favorites {
        uint favoriteNumber;
        uint birthDay;
        string favoriteColor;
        uint[5] lotteryNumbers;
    }

    Favorites[] public userFavorites;

    function addFavorites(
        uint _favoriteNumber,
        uint _birthDay,
        string calldata _favoriteColor,
        uint[5] calldata _lotteryNumbers
    ) public {
        Favorites storage newFavorite = userFavorites.push();
        newFavorite.favoriteNumber = _favoriteNumber;
        newFavorite.birthDay = _birthDay;
        newFavorite.favoriteColor = _favoriteColor;
        newFavorite.lotteryNumbers = _lotteryNumbers;
        }
}