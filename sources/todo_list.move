module demo::todo_list;

use std::string::String;
use sui::clock::Clock;

public struct TodoList has key, store{
    id: UID,
    name: String,
    description: String,
    items: vector<String>,
    is_completed: bool,
    date_created: u64
}

#[allow(lint(self_transfer))]
public fun create_todo(name: String, description: String, clock: &Clock, ctx: &mut TxContext){
    let todo_list = TodoList {
        id: object::new(ctx),
        name,
        description,
        is_completed: false,
        items: vector::empty<String>(),
        date_created: clock.timestamp_ms()
    };
    transfer::public_transfer(todo_list, ctx.sender());
}