use core::traits::{Into, Default};
use array::ArrayTrait;
use serde::Serde;
use option::{Option, OptionTrait};
use debug::PrintTrait;
use dojo::world::IWorldDispatcherTrait;

use starknet::testing::set_contract_address;

use tsubasa::components::{Game, Roles, DeckCard};
use tsubasa::tests::utils::{spawn_world, get_players, create_game};
use tsubasa::systems::create_deck_system;

#[test]
#[available_gas(30000000)]
fn test_create_deck() {
    let (player1, player2, _) = get_players();

    let world = spawn_world();

    let game_id = create_game(world, player1, player2);

    let mut create_deck_calldata = array![player1.into()];

    create_deck_calldata.append(1);

    // create deck

    world.execute('create_deck_system', create_deck_calldata);
}