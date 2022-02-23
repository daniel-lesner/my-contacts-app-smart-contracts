// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

interface IContactStorage {
    /// @notice Store contact information, can only be owner of account addres
    /// @param account Address of user storing the contact
    /// @param contactInfo String containing contact information
    /// isAddressOwner modifier must be provided
    function setContact(address account, string memory contactInfo) external;

    /// @notice Delete contact, can only be owner of account addres
    /// @param account Address of user deleting the contact
    /// @param deletedContactId The Id of contact to be deleted
    /// isAddressOwner modifier must be provided
    function deleteContact(address account, uint8 deletedContactId) external;

    /// @notice Modify contact information, can only be owner of account addres
    /// @param account Address of user modifying the contact
    /// @param modifiedContactId The id of contact to be modified
    /// @param modifiedContactInfo String containing modified contact information
    /// isAddressOwner modifier must be provided
    function modifyContact(
        address account,
        uint8 modifiedContactId,
        string memory modifiedContactInfo
    ) external;

    /// @notice Retrieve data of a specific contact information
    /// @param account Address of the user you want to retrieve contact
    /// @param contactId The id of contact you want to retrieve
    /// @return contactInfo String containing the contact information
    function getContact(address account, uint8 contactId)
        external
        view
        returns (string memory contactInfo);

    /// @notice Emitted when contact is added
    /// @param sender The address who added contact
    /// @param currentContactId The id of added contact
    event ContactAdded(address sender, uint8 currentContactId);

    /// @notice Emitted when contact is deleted
    /// @param sender The address who deleted contact
    event ContactDeleted(address sender);

    /// @notice Emitted when contact is modified
    /// @param sender The address who modified contact
    event ContactModified(address sender);
}
