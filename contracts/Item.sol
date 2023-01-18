// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Item {

    //item description in a struct  
    struct item {
        string name;
        string category;
        uint price;
        uint itemId;
        address payable seller;
    }

    mapping(uint => item) items;

    function addItem(string memory _name, string memory _category, uint _price) public {
        
    }

}