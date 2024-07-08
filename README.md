# KhushiERC20 Token

KhushiERC20 is an ERC20 token implementation using the OpenZeppelin library. This token includes additional features such as account freezing and custom minting and burning functionalities.

## Features

- **ERC20 Standard Compliance**: Implements the ERC20 token standard using OpenZeppelin's library.
- **Owner Control**: The contract owner has exclusive rights to mint and burn tokens.
- **Account Freezing**: The contract owner can freeze and unfreeze accounts.
- **Customized Decimals**: The token has 10 decimal places.
- **Disabled Approve Function**: The `approve` function is disabled as it's not needed for this contract.

## Getting Started

### Prerequisites

- Solidity ^0.8.0
- OpenZeppelin Contracts

### Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/KhushiERC20.git
   ```

2. Install the necessary dependencies:
   ```sh
   npm install @openzeppelin/contracts
   ```

### Deployment

Deploy the contract to the Ethereum network using your preferred method (Remix, Truffle, Hardhat, etc.).

Example using Remix:
1. Open Remix IDE.
2. Create a new file `KhushiERC20.sol` and paste the contract code.
3. Compile the contract.
4. Deploy the contract.

## Contract Overview

### Constructor

- `constructor() ERC20("Khushi", "KH")`: Initializes the token with the name "Khushi" and symbol "KH". Mints 100 tokens to the contract owner.

### Functions

- `onlyOwner()`: Modifier to restrict access to owner-only functions.
- `decimals() public pure override returns (uint8)`: Returns the number of decimals (10) for the token.
- `mintTokens(address to, uint256 value) public onlyOwner`: Mints tokens to the specified address. Only callable by the owner.
- `burnTokens(uint256 amount) public onlyOwner`: Burns the specified amount of tokens from the owner's balance.
- `freezeAccount(address account) public onlyOwner`: Freezes the specified account, preventing transfers.
- `unfreezeAccount(address account) public onlyOwner`: Unfreezes the specified account.
- `transfer(address to, uint256 amount) public override onlyOwner returns (bool)`: Transfers tokens to the specified address if the recipient's account is not frozen.
- `approve(address, uint256) public pure override returns (bool)`: Disabled approve function. Always reverts.

## Usage

### Minting Tokens

To mint tokens, call the `mintTokens` function with the recipient's address and the amount to mint. Only the contract owner can perform this action.

```solidity
khushiERC20.mintTokens(recipientAddress, amount);
```

### Burning Tokens

To burn tokens, call the `burnTokens` function with the amount to burn. Only the contract owner can perform this action.

```solidity
khushiERC20.burnTokens(amount);
```

### Freezing and Unfreezing Accounts

To freeze an account, call the `freezeAccount` function with the account's address. To unfreeze an account, call the `unfreezeAccount` function with the account's address. Only the contract owner can perform these actions.

```solidity
khushiERC20.freezeAccount(accountAddress);
khushiERC20.unfreezeAccount(accountAddress);
```

### Transferring Tokens

To transfer tokens, call the `transfer` function with the recipient's address and the amount to transfer. Only the contract owner can perform this action, and the recipient's account must not be frozen.

```solidity
khushiERC20.transfer(recipientAddress, amount);
```

## License

This project is licensed under the MIT License.
