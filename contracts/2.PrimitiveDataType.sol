//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract PrimitiveDataType {
    bool public boo = true;

    uint8 public u8 = 1;
    uint public u256 = 456;

    int8 public i8 = -1;
    int public i256 = 456;

    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    bytes1 a = 0xb5;
}
