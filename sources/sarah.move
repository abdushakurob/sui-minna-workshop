module demo::sarah;


public struct Sarah has key, store {
    id:UID
}
#[allow(lint(self_transfer))]
public fun mint(ctx: &mut TxContext){
    let sarah = Sarah {
        id: object::new(ctx)
    };
    transfer::public_transfer(sarah, ctx.sender());
}