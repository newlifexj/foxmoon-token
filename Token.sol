// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./BEP20Mintable.sol";
import "./BEP20Burnable.sol";

/**
 * @title Token
 * @dev Implementation of the Token
 */
contract Token is BEP20Mintable, BEP20Burnable {
    constructor(
        string memory name_,
        string memory symbol_,
        uint8 decimals_,
        uint256 initialBalance_
    ) payable BEP20(name_, symbol_) {
        _setupDecimals(decimals_);
        _mint(_msgSender(), initialBalance_);
    }

    /**
     * @dev Function to mint tokens.
     *
     * NOTE: restricting access to owner only. See {BEP20Mintable-mint}.
     *
     * @param account The address that will receive the minted tokens
     * @param amount The amount of tokens to mint
     */
    function _mint(address account, uint256 amount)
        internal
        override
        onlyOwner
    {
        super._mint(account, amount);
    }

    /**
     * @dev Function to stop minting new tokens.
     *
     * NOTE: restricting access to owner only. See {BEP20Mintable-finishMinting}.
     */
    function _finishMinting() internal override onlyOwner {
        super._finishMinting();
    }
}
