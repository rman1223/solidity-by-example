//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract X {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract Y {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

contract B is X("Input to X"), Y("Input to Y") {

}

contract C is X, Y {
    constructor(string memory _name, string memory _text) X(_name) Y(_text) {}
}

// Order of constructors called:
// 1. X
// 2. Y
// 3. D
contract D is X, Y {
    constructor() X("X was called") Y("Y was called") {}
}

// Order of constructors called:
// 1. X
// 2. Y
// 3. E
contract E is X, Y {
    constructor() Y("Y was called") X("X was called") {}
}