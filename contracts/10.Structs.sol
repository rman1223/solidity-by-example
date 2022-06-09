//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Structs {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) public {
        todos.push(
            Todo(_text, false)
        );

        todos.push(
            Todo({
                text: _text,
                completed: false
            })
        );

        Todo memory todo;
        todo.text = _text;
        todos.push(todo);
    }

    // solidity automatically created a getter for todos
    function get(uint _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    // update text
    function updateText(uint _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // update completed
    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}
