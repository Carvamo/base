// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract FavoriteRecords {
    
    mapping(string => bool) public approvedRecords;
    mapping(address => mapping(string => bool)) private userFavorites;
    string[] private approvedList;

    error NotApproved(string albumName);

    constructor() {
        approvedList = [
            "Thriller",
            "Back in Black",
            "The Bodyguard",
            "The Dark Side of the Moon",
            "Their Greatest Hits (1971-1975)",
            "Hotel California",
            "Come On Over",
            "Rumours",
            "Saturday Night Fever"
        ];

        for (uint i = 0; i < approvedList.length; i++) {
            approvedRecords[approvedList[i]] = true;
        }
    }

    function getApprovedRecords() public view returns (string[] memory) {
        return approvedList;
    }

    function addRecord(string memory albumName) public {
        if (!approvedRecords[albumName]) {
            revert NotApproved(albumName);
        }
        userFavorites[msg.sender][albumName] = true;
    }

    function getUserFavorites(address user) public view returns (string[] memory) {
        uint count = 0;
        for (uint i = 0; i < approvedList.length; i++) {
            if (userFavorites[user][approvedList[i]]) {
                count++;
            }
        }

        string[] memory favorites = new string[](count);
        uint index = 0;
        for (uint i = 0; i < approvedList.length; i++) {
            if (userFavorites[user][approvedList[i]]) {
                favorites[index] = approvedList[i];
                index++;
            }
        }
        return favorites;
    }

    function resetUserFavorites() public {
        for (uint i = 0; i < approvedList.length; i++) {
            userFavorites[msg.sender][approvedList[i]] = false;
        }
    }
}