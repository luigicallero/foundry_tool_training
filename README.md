## Foundry

### Learning from Nader Dabit at [Smart Contract Development with Foundry](https://www.youtube.com/watch?v=uelA2U9TbgM&ab_channel=NaderDabit)

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

For asserts:

https://book.getfoundry.sh/reference/ds-test?highlight=emit%20log#logging-events


## Folders Structure (after forge init... )

src: Where contracts are located
script:
test: Where scripts execute against contracts
out: generated after test is executed (ABI)

## Usage
### Initialize a project
```shell
$ forge init foundry_tool_training
```

### Build (no other parameters are required)

```shell
$ forge build
```

### Test

```shell
$ forge test
```

:bulb: Interesting stuff to test

Initial setup for all functions:
```shell
function setUp() public {
    counter = new Counter();
    counter.setNumber(200);
}
```

* Logging during tests:

https://book.getfoundry.sh/reference/ds-test?highlight=emit%20log_string_uint#logging-events
 
```shell
emit log_named_uint("Initial value", value);
emit log_uint(value);
emit log_string("This is the end of the story"); 
```

* Simulate different ussers 
```shell
address bob = address(0x1);
vm.startPrank(bob);
```

* Expect to revert
> To be used before the action you expect to revert
> Use the exact output of the error between ""
```shell
vm.expectRevert("not owner of token");
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil (Local Blockchain)

```shell
$ anvil
```

### Simulate Deploy and Deploy in Anvil (local blockchain)

#### Simulation
```shell
forge script script/Contract.s.sol:ContractScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```
#### Deployment
```shell
forge script script/Contract.s.sol:ContractScript --rpc-url <your_rpc_url> --private-key <your_private_key> --broadcast
```

:bulb: Sample
```shell 
forge script script/Contract.s.sol:ContractScript --fork-url http://localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast
```

### Cast

```shell
$ cast <subcommand>
```

:bulb: Sample to read from Anvil Blockchain
```shell
cast call 0x5fbdb2315678afecb367f032d93f642f64180aa3 "getNumber()(uint)"
```

:bulb: Sample to write to Anvil Blockchain
> When using send to a function that requires a parameter make sure to use the exact variable type (uint256 instead of uint)

```shell
export PRIVATE_KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

cast send 0x5fbdb2315678afecb367f032d93f642f64180aa3 "increment()" --private-key $PRIVATE_KEY
cast call 0x5fbdb2315678afecb367f032d93f642f64180aa3 "getNumber()(uint)"

cast send 0x5fbdb2315678afecb367f032d93f642f64180aa3 "setNumber(uint256)" 20 --private-key $PRIVATE_KEY
cast call 0x5fbdb2315678afecb367f032d93f642f64180aa3 "getNumber()(uint)"

```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
