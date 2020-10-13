'use strict';

class DigitalAsset {

    /**
     *
     * DigitalAsset
     *
     * Constructor for a DigitalAsset object.
     *
     * @param {String} assetId - Unique identifier of the digital asset.
     * @param {String} assetName - Name of the digital asset.
     * @param {String} assetHash - Hash of the digital asset.
     * @param {String} assetOwner - Email address of the user who owns the digital asset.
     * @param {String} createdBy - Email address of the user who first created the asset (also the original owner of the asset).
     * @param {String} createTimestamp - Timestamp that indicates when the asset was first added in the blockchain.
     * @param {String} lastModifiedBy - Email address of the user who last modified the asset.
     * @param {String} modifiedTimestamp - Timestamp that indicates when the asset was last modified.
     * @param {Array} approvedUsers - List of email addresses each representing a user who is allowed to make modifications to the asset.
     * @param {Array} modificationsPendingApproval - List of modifications to the asset that are pending approval from owner of asset.
     * @returns - DigitalAsset object
     */

    constructor(assetId, assetName, assetHash, assetOwner, createdBy, createTimestamp, lastModifiedBy, modifiedTimestamp, approvedUsers, modificationsPendingApproval) {
        this.assetId = assetId;
        this.assetName = assetName;
        this.assetHash = assetHash;
        this.assetOwner = assetOwner;
        this.createdBy = createdBy;
        this.createTimestamp = createTimestamp;
        this.lastModifiedBy = lastModifiedBy;
        this.modifiedTimestamp = modifiedTimestamp;
        this.approvedUsers = approvedUsers;
        this.modificationsPendingApproval = modificationsPendingApproval;
        this.type = 'DigitalAsset';
        return this;
    }
}

module.exports = DigitalAsset;