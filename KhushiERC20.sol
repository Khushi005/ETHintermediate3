// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract KhushiERC20 is ERC20 {
    address public owner;
    mapping(address => bool) public frozenAccounts;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    constructor() ERC20("Khushi", "KH") {
        owner = msg.sender;
        _mint(owner, 100 * 10**decimals());
    }

    function decimals() public pure override returns (uint8) {
        return 10;
    }

    function mintTokens(address to, uint256 value) public onlyOwner {
        _mint(to, value);
    }

    function burnTokens(uint256 amount) public onlyOwner {
        _burn(msg.sender, amount);
    }

    function freezeAccount(address account) public onlyOwner {
        frozenAccounts[account] = true;
    }

    function unfreezeAccount(address account) public onlyOwner {
        frozenAccounts[account] = false;
    }

    function transfer(address to, uint256 amount) public override onlyOwner returns (bool) {
        require(!frozenAccounts[to], "Recipient account is frozen");
        return super.transfer(to, amount);
    }

    // Disable approve function - not needed for this contract
    function approve(address, uint256) public pure override returns (bool) {
        revert("Disabled: approve function is not needed");
    }
    
}
