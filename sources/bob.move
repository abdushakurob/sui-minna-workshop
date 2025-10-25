module demo::bob;
use sui::display;
use sui::package;


public struct BOB has drop {}

public struct Bob has key, store {
    id: UID
}

fun init(otw: BOB, ctx: &mut TxContext) {
    let publisher = package::claim(otw, ctx);
    let mut display = display::new<Bob>(&publisher, ctx);

    display.add(
        b"name".to_string(),
        b"Bob the rich dog".to_string()
    );

    display.add(
        b"description".to_string(),
        b"One of the greatest heroes of all time. Join us!".to_string()
    );

    display.add(
        b"image_url".to_string(),
        b"https://i.ibb.co/N2KPVQCs/Gemini-Generated-Image-lx4uoclx4uoclx4u.png".to_string()
    );

    // Update the display with the new data.
    // Must be called to apply changes.
    display.update_version();

    transfer::public_transfer(publisher, ctx.sender());
    transfer::public_transfer(display, ctx.sender());
}

#[allow(lint(self_transfer))]
public fun mint_bob(ctx: &mut TxContext) {
    let bob = Bob {
        id: object::new(ctx)
    };

    transfer::public_transfer(bob, ctx.sender());
}