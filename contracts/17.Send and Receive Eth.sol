//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

// transfer (2300 gas, throws error)
// send (2300 gas, returns bool)
// call (forward all gas or set gas, returns bool)

// receive() external payable
// fallback() external payable
// receive() is called if msg.data is empty, otherwise fallback() is called.

// call in combination with re-entrancy guard is the recommended method to use after December 2019.

// Guard against re-entrancy by
// making all state changes before calling other contracts
// using re-entrancy guard modifier

contract ReceiveEther {
    receive() external payable {}

    fallback() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        // This function is no longer recommended for sending Ether.
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        // Send returns a boolean value indicating success or failure.
        // This function is not recommended for sending Ether.
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}