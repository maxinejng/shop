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

    mapping(address => seller) sellers;

    uint public sellerCount;

    //new seller 
    //he has to pay for using the platform
    function sellerSignUp(string memory _name) public payable {
        require(!sellers[msg.sender].isRegister, "You are already registered");
        require(msg.value == 5 ether, "You haven't paid yet");
        sellers[msg.sender].name = _name;
        sellers[msg.sender].sellerAddress = msg.sender;
        sellers[msg.sender].hasPaid = true;
        sellerCount++;
    }

    //refund cancelled orders


}