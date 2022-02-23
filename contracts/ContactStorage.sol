// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import "./interfaces/IContactStorage.sol";

contract ContactStorage is IContactStorage {
    mapping(address => uint8) public userAddressToNumberOfContacts;
    mapping(address => mapping(uint8 => string))
        private _userAddressToContactsMapping;

    modifier isAddressOwner(address account) {
        require(
            msg.sender == account,
            "Only address owner can add/delete/modify his contacts"
        );
        _;
    }

    function setContact(address account, string memory contactInfo)
        public
        override
        isAddressOwner(account)
    {
        userAddressToNumberOfContacts[account]++;
        uint8 currentContactId = userAddressToNumberOfContacts[account];
        mapping(uint8 => string)
            storage contactData = _userAddressToContactsMapping[account];
        contactData[currentContactId] = contactInfo;

        emit ContactAdded(msg.sender, currentContactId);
    }

    function deleteContact(address account, uint8 deletedContactId)
        public
        override
        isAddressOwner(account)
    {
        mapping(uint8 => string)
            storage contactData = _userAddressToContactsMapping[account];
        contactData[deletedContactId] = "";

        emit ContactDeleted(msg.sender);
    }

    function modifyContact(
        address account,
        uint8 modifiedContactId,
        string memory modifiedContactInfo
    ) public override isAddressOwner(account) {
        mapping(uint8 => string)
            storage contactData = _userAddressToContactsMapping[account];
        contactData[modifiedContactId] = modifiedContactInfo;

        emit ContactModified(msg.sender);
    }

    function getContact(address account, uint8 contactId)
        public
        view
        override
        returns (string memory contactInfo)
    {
        contactInfo = _userAddressToContactsMapping[account][contactId];
    }
}
