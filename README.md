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

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
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

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```
```shell Sample
forge script script/Contract.s.sol:ContractScript --fork-url http://localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast
```
### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
