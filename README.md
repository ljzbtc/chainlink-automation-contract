# SmallBank Smart Contract

## Overview

SmallBank is a simple Ethereum smart contract that simulates basic banking operations. It allows users to deposit Ether and implements an automated system to transfer half of the contract's balance to the owner when it reaches 0.1 ETH or more.

## Features

- **Deposit**: Users can deposit Ether into the contract.
- **Withdrawal**: The bank owner can withdraw all funds from the contract.
- **Automated Transfer**: Using Chainlink Automation, the contract automatically transfers half of its balance to the owner when it reaches 1 ETH or more.
- **Balance Tracking**: The contract keeps track of individual user deposits.

## Contract Functions

### `constructor()`
- Initializes the contract and sets the deployer as the bank owner.

### `withdraw()`
- Allows the bank owner to withdraw all funds from the contract.

### `deposited()`
- Public function called when users deposit Ether into the contract.

### `checkUpkeep(bytes calldata checkData)`
- Part of the Chainlink Automation interface.
- Checks if the contract balance is 1 ETH or more.
- Returns a boolean indicating if upkeep is needed and the current balance.

### `performUpkeep(bytes calldata performData)`
- Part of the Chainlink Automation interface.
- Transfers half of the contract balance to the owner if conditions are met.

### `receive()`
- Fallback function to handle direct Ether transfers to the contract.

## Setup and Deployment

1. Deploy the contract to an Ethereum network (mainnet, testnet, or local network).
2. The deploying address becomes the bank owner.
3. Register the contract with Chainlink Automation for automatic balance checks and transfers.

## Usage

- Users can send Ether directly to the contract address to make deposits.
- The bank owner can call the `withdraw()` function to withdraw all funds.
- Chainlink Automation will periodically check the contract balance and transfer half to the owner when it reaches 1 ETH or more.

## Security Considerations

- Only the bank owner can withdraw funds.
- The automated transfer system relies on Chainlink Automation, ensure proper setup and LINK token funding.
- Consider implementing additional security measures like pause functionality or withdrawal limits in a production environment.

## License

This project is licensed under the MIT License.