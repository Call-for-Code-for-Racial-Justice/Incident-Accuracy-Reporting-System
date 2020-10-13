'use strict';

class ModificationPendingApproval {

    /**
     *
     * ModificationPendingApproval
     *
     * Constructor for a ModificationPendingApproval object that serves as entries within the modificationsPendingApproval array of a DigitalAsset object.
     *
     * @param {String} modFileName - Name for the new file being uploaded for this asset.
     * @param {String} modFileHash - Hash of the digital asset.
     * @param {String} lastModifiedBy - Email address of the user who last modified the asset.
     * @param {String} modifiedTimestamp - Timestamp that indicates when the asset was last modified.
     * @returns - ModificationPendingApproval object
     */

    constructor(modFileName, modFileHash, lastModifiedBy, modifiedTimestamp) {

        this.modFileName = modFileName;
        this.modFileHash = modFileHash;
        this.lastModifiedBy = lastModifiedBy;
        this.modifiedTimestamp = modifiedTimestamp;
        return this;
    }
}

module.exports = ModificationPendingApproval;