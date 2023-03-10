// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//for seller
contract Shop {
    
    //able to receive ether from seller
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    //characteristic of a seller
    struct seller {
        string name;
        address sellerAddress;
        bool hasPaid;
        bool isRegister;
    }

    //item description in a struct  
    struct item {
        string name;
        string category;
        uint price;
        uint itemId;
        address seller;
        bool isActive;
    }

    mapping(address => seller) public sellers;

    mapping(uint => item) public items;

    //count the total of seller 
    uint public sellerCount;

    //count the total of item
    uint public itemCount;

    modifier onlyOwner() {
        require(owner == payable(msg.sender), "You can't add an item to the shop.");
        _;
    }

    modifier notRegistered() {        
        require(!sellers[msg.sender].isRegister, "You are already registered");
        _;
    }

    modifier hasPaid() {
        require(msg.value == 5 ether, "You haven't paid yet or you haven't paid 5 ether");
        _;
    }

    //new seller                
    //he has to pay for using the platform
    function sellerSignUp(string memory _name) public payable notRegistered hasPaid {
        sellers[msg.sender].name = _name;
        sellers[msg.sender].sellerAddress = msg.sender;
        sellers[msg.sender].hasPaid = true;
        sellers[msg.sender].isRegister = true;
        sellerCount++;
    }

    //to add an item in the shop 
    function addItem(string memory _name, string memory _category, uint _price) public onlyOwner {
        items[itemCount].name = _name;
        items[itemCount].category = _category;
        items[itemCount].price = _price;
        items[itemCount].itemId = itemCount;
        items[itemCount].isActive = true;
        items[itemCount].seller = msg.sender;
        itemCount++;
    }



}