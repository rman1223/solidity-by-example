//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

// local:
//      declared inside a function
//      not stored on the blockchain
// state:
//      declared ourside a function
//      stored on the blockchain
// globla:
//      provides information about blockchain

contract Variables {
    // state
    string public text = "Hello";
    uint public num = 123;

    // constant
    address public constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint public constant MY_UINT = 123;

    // Immutable
    address public immutable MY_ADDRESS_IMMUTABLE;
    uint public immutable MY_UINT_IMMUTABLE;

    constructor(uint _myUInt) {
        MY_ADDRESS_IMMUTABLE = msg.sender;
        MY_UINT_IMMUTABLE = _myUInt;
    }
    
    function doSomething() public {
        // local
        uint i = 456;

        // global
        uint timestamp = block.timestamp;
        address sender = msg.sender;
    }
}
