/*
 * SPDX-License-Identifier: Apache-2.0
 */

'use strict';

const { Contract } = require('fabric-contract-api');
//import files containing constructors
const DigitalAsset = require('./DigitalAsset.js');
const ModificationPendingApproval = require('./ModificationPendingApproval.js');
const User = require('./User.js');

class DigitalAssetContract extends Contract {
    constructor(){
       super('DigitalAssetContract');
    }

    /*async init(ctx) {
        console.info('Contract is instantiating');
    }*/

    /**
     * digitalAssetExists
     *
     * This function checks if a DigitalAsset exists in the blockchain.
     *
     * @param {Context} ctx - The context of the transaction.
     * @param {String} assetId - Identifier for the digital asset.
     * @returns - true if the asset exists and false if the asset does not exist.
     */
    async digitalAssetExists(ctx, assetId) {
        const buffer = await ctx.stub.getState(assetId);
        if (!!buffer && buffer.length > 0) {
            let digitalAsset = JSON.parse(buffer.toString());
            return digitalAsset.type === 'DigitalAsset';
        }
        return false;
    }

    /**
     *
     * userExists
     *
     * This function checks if a User exists in the blockchain.
     *
     * @param {Context} ctx - The context of the transaction.
     * @param {String} emailAddress - Identifier for the user.
     * @returns - true if the asset exists and false if the asset does not exist.
     */
    async userExists(ctx, emailAddress) {
        const buffer = await ctx.stub.getState(emailAddress);
        if (!!buffer && buffer.length > 0) {
            let digitalAsset = JSON.parse(buffer.toString());
            return digitalAsset.type === 'User';
        }
        return false;
    }

    /**
     *
     * createDigitalAsset
     *
     * This function creates a new DigitalAsset.
     *
     * @param {Context} ctx - The context of the transaction.
     * @param {String} assetId - Unique identifier of the digital asset.
     * @param {String} assetName - File name of the digital asset.
     * @param {String} assetHash - Hash of the digital asset.
     * @param {String} createdBy - Email address of the user who first created the asset (also the original owner of the asset).
     * @returns - nothing - but creates a DigitalAsset object and updates the world state with the DigitalAsset.
     */
    async createDigitalAsset(ctx, assetId, assetName, assetHash, createdBy) {
        console.info("Enter: createDigitalAsset");
        let response = {};
        let existingAssets = await this.queryDigitalAssetByHash(ctx, assetHash);
        if (existingAssets.length !== 0) {
            //asset with this hash exists. Return with error msg.
            response.err = 'Digital asset already exists';
            response.existingAsset = existingAssets[0].Record;
            return response;
        }
        //asset with this hash does not exist, can go ahead and create the asset.
        let digitalAsset = new DigitalAsset(assetId, assetName, assetHash, createdBy, createdBy, new Date(), null, null, [createdBy], []);
        await ctx.stub.putState(assetId, Buffer.from(JSON.stringify(digitalAsset)));

        // define and set createDigitalAssetEvent
        let createDigitalAssetEvent = {
            type: 'Create Digital Asset',
            assetId: assetId,
            assetHash: assetHash,
            assetOwner: createdBy,
            createdBy: createdBy,
            createTimestamp: new Date(digitalAsset.createTimestamp)
        };
        ctx.stub.setEvent('CreateDigitalAssetEvent-'+assetId, Buffer.from(JSON.stringify(createDigitalAssetEvent)));
        response.data = 'Digital asset was successfully added to the blockchain.';
        return response;
    }

    /**
     *
     * createUser
     *
     * This function creates a new User. Will be called after the user is successfully registered and added to the wallet.
     *
     * @param {Context} ctx - The context of the transaction.
     * @param emailAddress - Email address of the user, will also be used as the identifier for the user.
     * @param firstName - First name of the user.
     * @param lastName - Last name of the user.
     * @returns - nothing - but creates a User object and updates the world state with the User.
     */
    async createUser(ctx, emailAddress, firstName, lastName) {
        console.info("Enter: createUser");
        let exists = await this.userExists(ctx, emailAddress);
        let response = {};
        if (exists) {
            response.err = `The User ${emailAddress} already exists`;
            return response;
        }

        let user = new User(emailAddress, firstName, lastName);
        await ctx.stub.putState(emailAddress, Buffer.from(JSON.stringify(user)));

        // define and set createUserEvent
        let createUserEvent = {
            type: 'Create User',
            emailAddress: emailAddress,
            firstName: firstName,
            lastName: lastName
        };
        ctx.stub.setEvent('CreateUserEvent-'+emailAddress, Buffer.from(JSON.stringify(createUserEvent)));
        response.data = `User with email address ${emailAddress} is updated in the world state.`;
        return response;
    }

    /**
     *
     * readDigitalAsset
     *
     * This function reads and returns the asset identified by assetId.
     *
     * @param {Context} ctx - the context of the transaction.
     * @param {String} assetId - Identifier for the digital asset.
     * @returns - the asset in JSON object form, if it exists, otherwise it throws an error
     */
    async readDigitalAsset(ctx, assetId) {
        console.log("Enter: readDigialAsset");
        let response = {};
        let exists = await this.digitalAssetExists(ctx, assetId);
        if (!exists) {
            response.err = `The Digital Asset ${assetId} does not exist`;
            return response;
        }

        let buffer = await ctx.stub.getState(assetId);
        response.data = JSON.parse(buffer.toString());

        return response;
    }

    /**
     *
     * updateDigitalAsset
     *
     * This function updates an existing DigitalAsset.
     *
     * @param {Context} ctx - the context of the transaction.
     * @param {String} assetId - Identifier for the digital asset.
     * @param {String} assetHash - Hash of the digital asset.
     * @param {String} lastModifiedBy - Email address of the user who last modified the asset.
     * @returns - nothing - but updates the world state with the DigitalAsset.
     */
    async updateDigitalAsset(ctx, assetId, assetHash, lastModifiedBy) {
        console.info("Enter: updateDigialAsset");
        let readResponse = await this.readDigitalAsset(ctx, assetId);
        let digitalAsset = readResponse.data;
        digitalAsset.assetHash = assetHash;
        digitalAsset.lastModifiedBy = lastModifiedBy;
        digitalAsset.modifiedTimestamp = new Date();
        await ctx.stub.putState(assetId, Buffer.from(JSON.stringify(digitalAsset)));
        let response = {};
        response.data = `DigitalAsset ${assetId} has been updated in the system.`;

        // define and set updateDigitalAssetEvent
        let updateDigitalAssetEvent = {
            type: 'Update Digital Asset',
            assetId: assetId,
            assetOwner: digitalAsset.assetOwner,
            lastModifiedBy: digitalAsset.lastModifiedBy,
            modifiedTimestamp: new Date(digitalAsset.modifiedTimestamp)
        };
        ctx.stub.setEvent('UpdateDigitalAssetEvent-'+assetId, Buffer.from(JSON.stringify(updateDigitalAssetEvent)));
        return response;
    }

    /**
     *
     * addApprovedModifierToDigitalAsset
     *
     * This function updates an existing DigitalAsset to add a new user as an approvedModifier.
     *
     * @param {Context} ctx - the context of the transaction.
     * @param {String} assetId - Identifier for the digital asset.
     * @param {String} newApprovedModifier - Identifier for the new approved modifier.
     * @returns - nothing - but updates the DigitalAsset in the world state.
     */
    async addApprovedModifierToDigitalAsset(ctx, assetId, newApprovedModifier) {
        console.info("Enter: addApprovedModifierToDigitalAsset");
        let readResponse = await this.readDigitalAsset(ctx, assetId);
        let digitalAsset = readResponse.data;
        if(!digitalAsset.approvedUsers){
            digitalAsset.approvedUsers = [];
        }
        let response = {};
        if(!digitalAsset.approvedUsers.includes(newApprovedModifier)) {
            //Add the new modifier to the array
            digitalAsset.approvedUsers.push(newApprovedModifier);
            await ctx.stub.putState(assetId, Buffer.from(JSON.stringify(digitalAsset)));
            // define and set addApprovedModifierToDigitalAssetEvent
            let addApprovedModifierToDigitalAssetEvent = {
                type: 'Add Approved Modifier To Digital Asset',
                assetId: assetId,
                approvedUser: newApprovedModifier
            };
            ctx.stub.setEvent('AddApprovedModifierToDigitalAssetEvent-'+assetId, Buffer.from(JSON.stringify(addApprovedModifierToDigitalAssetEvent)));
            response.data = `DigitalAsset ${assetId} has been updated in the system.`;
            return response;
        }
        else{
            response.err = `No update required - the new user ${newApprovedModifier} is already an approved modifier of the DigitalAsset ${assetId}.`;
            return response;
        }
    }

    /**
     *
     * addPendingModificationToDigitalAsset
     *
     * This function updates an existing DigitalAsset to create a new entry under DigitalAsset.modificationsPendingApproval.
     *
     * @param {String} modFileName - Temporary name for pending modification file in COS.
     * @param {String} modFileHash - Hash of the digital asset.
     * @param {String} lastModifiedBy - Email address of the user who last modified the asset.
     * @param {String} modifiedTimestamp - Timestamp that indicates when the asset was last modified.
     * @returns - nothing - but updates the DigitalAsset in the world state.
     */
    async addPendingModificationToDigitalAsset(ctx, assetId, modFileName, modFileHash, lastModifiedBy) {
        console.info("Enter: addPendingModificationToDigitalAsset");
        let readResponse = await this.readDigitalAsset(ctx, assetId);
        let digitalAsset = readResponse.data;
        if(!digitalAsset.modificationsPendingApproval){
            digitalAsset.modificationsPendingApproval = [];
        }
        //Create new modification object and add to the array
        let modificationPendingApproval = new ModificationPendingApproval(modFileName, modFileHash, lastModifiedBy, new Date());
        digitalAsset.modificationsPendingApproval.push(modificationPendingApproval);
        await ctx.stub.putState(assetId, Buffer.from(JSON.stringify(digitalAsset)));
        // define and set addPendingModificationToDigitalAssetEvent
        let addPendingModificationToDigitalAssetEvent = {
            type: 'Add Pending Modification To Digital Asset Event',
            assetId: assetId,
            assetOwner: digitalAsset.assetOwner,
            lastModifiedBy: modificationPendingApproval.lastModifiedBy,
            modifiedTimestamp: new Date(modificationPendingApproval.modifiedTimestamp)
        };
        ctx.stub.setEvent('AddPendingModificationToDigitalAssetEvent-'+assetId, Buffer.from(JSON.stringify(addPendingModificationToDigitalAssetEvent)));
        let response = {};
        response.pendingApproval = true;
        response.data = `The asset ${digitalAsset.assetName} will be updated subject to approval from the assetOwner ${digitalAsset.assetOwner}.`;
        return response;
    }

    /**
     *
     * deleteDigitalAsset
     *
     * This function marks an existing Digital Asset from the blockchain as deleted.
     *
     * @param {Context} ctx - the context of the transaction.
     * @param {String} assetId - Identifier for the digital asset.
     * @param {String} assetDeleter - Email address of the user who is trying to delete the asset.
     * @returns - nothing - but marks the Digital Asset as "deleted" in the world state if the asset exists and the assetDeleter is the same as the assetOwner, else throws an error.
     */
    async deleteDigitalAsset(ctx, assetId, assetDeleter) {
        console.info("Enter: deleteDigitalAsset");
        let response = {};
        let readResponse = await this.readDigitalAsset(ctx, assetId);
        let digitalAsset = readResponse.data;

        if(digitalAsset.assetOwner !== assetDeleter){
            response.err = 'Digital assets can only be deleted by the owner of the asset.';
            return response;
        }

        await ctx.stub.deleteState(assetId);
        response.data = 'Digital asset was successfully deleted from the blockchain.';

        // define and set deleteDigitalAssetEvent
        let deleteDigitalAssetEvent = {
            type: 'Delete Digital Asset',
            assetId: assetId,
            assetOwner: assetDeleter
        };
        ctx.stub.setEvent('DeleteDigitalAssetEvent-'+assetId, Buffer.from(JSON.stringify(deleteDigitalAssetEvent)));
        return response;
    }

    /**
     *
     * changeOwnershipOfAsset
     *
     * This function changes the ownership of an existing object.
     *
     * @param {Context} ctx - the context of the transaction.
     * @param {String} assetId - Identifier for the digital asset.
     * @param {String} assetModifier - Email address of the user who is trying to update the ownership details of the asset.
     * @param {String} newAssetOwner - Email address of the user who will now have ownership of this asset.
     * @returns - nothing - but updates the world state with the DigitalAsset.
     */
    async changeOwnershipOfAsset(ctx, assetId, assetModifier, newAssetOwner) {
        console.info("Enter: changeOwnershipOfAsset");
        let readResponse = await this.readDigitalAsset(ctx, assetId);
        let digitalAsset = readResponse.data;
        let response = {};
        if(digitalAsset.assetOwner !== assetModifier){
            response.err = 'Ownership of digital assets can only be updated by the current owner of the asset.';
            return response;
        }

        digitalAsset.assetOwner = newAssetOwner;
        //also add to list of approved modifiers.
        this.addApprovedModifierToDigitalAsset(ctx, assetId, newAssetOwner);
        await ctx.stub.putState(assetId, Buffer.from(JSON.stringify(digitalAsset)));

        response.data = `The owner of DigitalAsset ${assetId} has successfully been updated in the system.`;

        // define and set updateDigitalAssetEvent
        let updateOwnershipOfAssetEvent = {
            type: 'Update Ownership of Asset',
            assetId: assetId,
            oldAssetOwner: assetModifier,
            newAssetOwner: digitalAsset.assetOwner
        };
        ctx.stub.setEvent('UpdateOwnershipOfAssetEvent-'+assetId, Buffer.from(JSON.stringify(updateOwnershipOfAssetEvent)));
        return response;
    }

    /**
     *
     * getModificationPendingApprovalFromAsset
     *
     * Get modificationPendingApproval identified by modFileName from the given asset's modificationsPendingApproval array
     *
     * @param {Context} ctx - the context of the transaction.
     * @param {Array} assetId - the identifier for the asset
     * @param {String} modFileName - the identifier for the modificationPendingApproval to be retrieved
     * @returns - the modificationPendingApproval entry if it exists, else return error.
     */
    async getModificationPendingApprovalFromAsset(ctx, assetId, modFileName) {
        console.info("Enter: getModificationPendingApproval");
        let response = {};
        let mod = null;
        let readResponse = await this.readDigitalAsset(ctx, assetId);
        let digitalAsset = readResponse.data;
        for(mod in digitalAsset.modificationsPendingApproval){
            if(digitalAsset.modificationsPendingApproval[mod].modFileName === modFileName){
                response.data = digitalAsset.modificationsPendingApproval[mod];
                return response;
            }
        }
        response.err = 'The modification pending approval could not be found in the asset.';
        return response;
    }

    /**
     *
     * deleteModificationPendingApprovalFromAsset
     *
     * Delete the modificationPendingApproval identified by modFileName from the modificationsPendingApproval array of the asset identified by assetId
     *
     * @param {String} assetId the identifier for the asset
     * @param {String} modFileName the identifier for the modificationPendingApproval to be removed
     * @returns - deletes the modificationPendingApproval entry and updates the asset in the world state
     */
    async deleteModificationPendingApprovalFromAsset(ctx, assetId, modFileName) {        
        console.info("Enter: deleteModificationPendingApprovalFromAsset");
        let response = {};
        let readResponse = await this.readDigitalAsset(ctx, assetId);
        let digitalAsset = readResponse.data;
        let i = 0;
        for (; i < digitalAsset.modificationsPendingApproval.length; i++){
            if (digitalAsset.modificationsPendingApproval[i].modFileName === modFileName){
                digitalAsset.modificationsPendingApproval.splice(i,1);
                break;
            }
            if(i === digitalAsset.modificationsPendingApproval.length){
                response.err = 'Pending modification could not be deleted.';
                return response;
            }
        }
        await ctx.stub.putState(assetId, Buffer.from(JSON.stringify(digitalAsset)));

        // define and set deleteModificationPendingApprovalFromAssetEvent
        let deleteModificationPendingApprovalFromAssetEvent = {
            type: 'Delete Modification Pending Approval from Asset Event',
            assetId: assetId,
            modFileName: modFileName,
            assetOwner: digitalAsset.assetOwner,
            lastModifiedBy: digitalAsset.lastModifiedBy,
            modifiedTimestamp: new Date(digitalAsset.modifiedTimestamp)
        };
        ctx.stub.setEvent('DeleteModificationPendingApprovalFromAssetEvent-'+assetId, Buffer.from(JSON.stringify(deleteModificationPendingApprovalFromAssetEvent)));
        response.data = 'Asset Modification was successfully deleted from the asset.';
        return response;
    }

    /**
     *
     * queryAllDigitalAssets
     *
     * Query and return all key value pairs representing digital assets in the world state
     *
     * @param {Context} ctx the transaction context
     * @returns - all key value pairs representing digital assets in the world state
     */
    async queryAllDigitalAssets(ctx) {
        console.info("Enter: queryAllDigitalAssets");
        let response = {};

        let queryString = {
            selector: {
                type: 'DigitalAsset'
            },
            use_index: ['_design/typeIndexDoc', 'typeIndex']
        };

        response = await this.queryWithQueryString(ctx, JSON.stringify(queryString));
        return response;
    }

    /**
     *
     * queryDigitalAssetByHash
     *
     * Query and return all key value pairs representing digital assets in the world state that have assetOwner = emailAddress
     *
     * @param {Context} ctx the transaction context
     * @param {String} assetHash Hash for the digital asset
     * @returns - the asset which has the assetHash. Else null.
     */
    async queryDigitalAssetByHash(ctx, assetHash) {
        console.info("Enter: createDigialAssetByHash");
        let response = null;

        let queryString = {
            selector: {
                type: 'DigitalAsset',
                assetHash: assetHash
            },
            use_index: ['_design/typeAndAssetHashIndexDoc', 'typeAndAssetHashIndex']
        };
        response = await this.queryWithQueryString(ctx, JSON.stringify(queryString));
        return response;
    }

    /**
     *
     * queryDigitalAssetsByUser
     *
     * Query and return all key value pairs representing digital assets in the world state that have assetOwner = emailAddress
     *
     * @param {Context} ctx the transaction context
     * @param {String} emailAddress Identifier for the user.
     * @returns - all key value pairs representing digital assets in the world state that have assetOwner = emailAddress
     */
    async queryDigitalAssetsByUser(ctx, emailAddress) {
        console.info("Enter: queryDigitalAssetByUser");
        let response = null;

        let queryString = {
            selector: {
                type: 'DigitalAsset',
                assetOwner: emailAddress
            },
            use_index: ['_design/typeAndAssetOwnerIndexDoc', 'typeAndAssetOwnerIndex']
        };

        response = await this.queryWithQueryString(ctx, JSON.stringify(queryString));
        return response;
    }

    /**
     *
     * queryAllPendingModificationRequests
     *
     * Query and return all modificationPendingApproval entries for all digital assets that have assetOwner = emailAddress
     *
     * @param {Context} ctx the transaction context
     * @param {String} emailAddress Identifier for the user.
     * @returns - all modificationPendingApproval entries for all digital assets that have assetOwner = emailAddress
     */
    async queryAllPendingModificationRequests(ctx, emailAddress) {
        console.info("Enter: queryAllPendingModificationRequests");
        let response = [];
        let queryResults = await this.queryDigitalAssetsByUser(ctx, emailAddress);

        let record = null;
        for(record in queryResults){
            response.push.apply(record.modificationsPendingApproval);
        }
        return response;

    }

    /**
     *
     * queryWithQueryString
     *
     * Evaluate a queryString
     *
     * @param {Context} ctx the transaction context
     * @param {String} queryString the query string to be evaluated
     *
     * @returns - the result of the query string
    */
    async queryWithQueryString(ctx, queryString) {
        console.info("Enter: queryWithQueryString");
        let resultsIterator = await ctx.stub.getQueryResult(queryString);

        let allResults = [];

        // eslint-disable-next-line no-constant-condition
        while (true) {
            let res = await resultsIterator.next();

            if (res.value && res.value.value.toString()) {
                let jsonRes = {};

                jsonRes.Key = res.value.key;

                try {
                    jsonRes.Record = JSON.parse(res.value.value.toString('utf8'));
                } catch (err) {
                    console.log(err);
                    jsonRes.Record = res.value.value.toString('utf8');
                }

                allResults.push(jsonRes);
            }
            if (res.done) {
                await resultsIterator.close();
                return allResults;
            }
        }
    }

    /**
     *
     * getHistoryForDigitalAsset
     *
     * Get the modification history for a digital asset.
     *
     * @param {Context} ctx - the context of the transaction.
     * @param {String} assetId - Identifier for the digital asset.
     *
     * @returns - the entire hisgtroy of the given asset identified by assetId.
    */
    async getHistoryForDigitalAsset(ctx, assetId) {
        console.info("Enter: getHistoryForDigitalAsset");
        console.info('- start getHistoryForDigitalAsset: %s\n', assetId);

        let resultsIterator = await ctx.stub.getHistoryForKey(assetId);
        let allResults = [];

        let index = 0;
        // eslint-disable-next-line no-constant-condition
        while (true) {
            let res = await resultsIterator.next();

            if (res.value && res.value.value.toString()) {
                let jsonRes = {};

                jsonRes.Key = index++;

                try {
                    jsonRes.Record = JSON.parse(res.value.value.toString('utf8'));
                } catch (err) {
                    console.log(err);
                    jsonRes.Record = res.value.value.toString('utf8');
                }

                allResults.push(jsonRes);
            }
            if (res.done) {
                await resultsIterator.close();
                return allResults;
            }
        }
    }

}

module.exports = DigitalAssetContract;