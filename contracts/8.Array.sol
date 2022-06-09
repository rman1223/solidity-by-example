//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Array {
    uint[] public arr;
    uint[] public arr2 = [1, 2, 3];
    // initialized to 0
    uint[10] public myFixedSizeArr;

    function get(uint i) public view returns (uint) {
        return arr[i];
    }

    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    function push(uint i) public {
        arr.push(i);
    }

    function pop() public {
        arr.pop();
    }

    function getLength() public view returns (uint) {
        return arr.length;
    }

    function remove(uint index) public {
        // delete does not change the array length
        // it sets the data to default value
        delete arr[index];
    }

    function examples() external {
        // create array in memory, only fixed size can be created
        uint[] memory a = new uint[](5);
    }
}

contract ArrayRemoveByShifting {
    uint[] public arr;

    function remove(uint _index) public {
        require(
            _index < arr.length,
            "index out of bound"
        );

        for (uint i = _index; i < arr.length - 1; i ++) {
            arr[i] = arr[i+1];
        }

        arr.pop();
    }

    function test() external {
        arr = [1, 2, 3, 4, 5];
        remove(2);

        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);

        arr = [1];
        remove(0);
        // []
        assert(arr.length == 0);
    }
}

contract ArrayReplaceFromEnd {
    uint[] public arr;

    function remove(uint index) public {
        arr[index] = arr[arr.length - 1];

        arr.pop();
    }

    function test() public {
        arr = [1, 2, 3, 4];

        remove(1);
        // [1, 4, 3]
        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);

        remove(2);
        // [1, 4]
        assert(arr.length == 2);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
    }
}