// SPDX-License-Identifier: MIT

pragma solidity 0.8.10;

import {IERC721} from '@openzeppelin/contracts/token/ERC721/IERC721.sol';

contract ProfileAccess {
    address internal immutable LENS_HUB;

    constructor(address _lensHub) {
        LENS_HUB = _lensHub;
    }

    /**
     * @dev Function used to check whether an address is the owner of a profile.
     *
     * @param requestorAddress The address to check ownership over a profile.
     * @param profileId The ID of the profile being checked for ownership.
     * @param data Optional data parameter, which may be used in future upgrades.
     * @return Boolean indicating whether address owns the profile or not.
     */
    function hasAccess(
        address requestorAddress,
        uint256 profileId,
        bytes memory data
    ) external view returns (bool) {
        return IERC721(LENS_HUB).ownerOf(profileId) == requestorAddress;
    }
}