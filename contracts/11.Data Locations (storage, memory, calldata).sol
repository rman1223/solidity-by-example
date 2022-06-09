//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

// storage - variable is a state variable (store on blockchain)
// memory - variable is in memory and it exists while a function is being called
// calldata - special data location that contains function arguments
contract DataLocations {
    uint[] public arr;
    mapping(uint => address) map;

    struct MyStruct {
        uint foo;
    }
    mapping(uint => MyStruct) myStructs;

    function _f(
        uint[] storage _arr,
        mapping(uint => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
        // do something with storage variables
    }

    // can return memory variables
    function g(uint[] memory _arr) public returns (uint[] memory) {
        // do something with memory array
    }

    // caldata is similar to memory
    // but immutable
    function h(uint[] calldata _arr) external {
        // do something with calldata array
    }
}
