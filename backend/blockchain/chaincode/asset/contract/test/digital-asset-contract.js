/*
 * SPDX-License-Identifier: Apache-2.0
 */

'use strict';

const { ChaincodeStub, ClientIdentity } = require('fabric-shim');
const { DigitalAssetContract } = require('..');
const winston = require('winston');

const chai = require('chai');
const chaiAsPromised = require('chai-as-promised');
const sinon = require('sinon');
const sinonChai = require('sinon-chai');

chai.should();
chai.use(chaiAsPromised);
chai.use(sinonChai);

class TestContext {

    constructor() {
        this.stub = sinon.createStubInstance(ChaincodeStub);
        this.clientIdentity = sinon.createStubInstance(ClientIdentity);
        this.logging = {
            getLogger: sinon.stub().returns(sinon.createStubInstance(winston.createLogger().constructor)),
            setLevel: sinon.stub(),
        };
    }

}

describe('DigitalAssetContract', () => {

    let contract;
    let ctx;

    beforeEach(() => {
        contract = new DigitalAssetContract();
        ctx = new TestContext();
        ctx.stub.getState.withArgs('1001').resolves(Buffer.from('{"value":"digital asset 1001 value"}'));
        ctx.stub.getState.withArgs('1002').resolves(Buffer.from('{"value":"digital asset 1002 value"}'));
    });

    describe('#digitalAssetExists', () => {

        it('should return true for a digital asset', async () => {
            await contract.digitalAssetExists(ctx, '1001').should.eventually.be.true;
        });

        it('should return false for a digital asset that does not exist', async () => {
            await contract.digitalAssetExists(ctx, '1003').should.eventually.be.false;
        });

    });

    describe('#createDigitalAsset', () => {

        it('should create a digital asset', async () => {
            await contract.createDigitalAsset(ctx, '1003', 'digital asset 1003 value');
            ctx.stub.putState.should.have.been.calledOnceWithExactly('1003', Buffer.from('{"value":"digital asset 1003 value"}'));
        });

        it('should throw an error for a digital asset that already exists', async () => {
            await contract.createDigitalAsset(ctx, '1001', 'myvalue').should.be.rejectedWith(/The digital asset 1001 already exists/);
        });

    });

    describe('#readDigitalAsset', () => {

        it('should return a digital asset', async () => {
            await contract.readDigitalAsset(ctx, '1001').should.eventually.deep.equal({ value: 'digital asset 1001 value' });
        });

        it('should throw an error for a digital asset that does not exist', async () => {
            await contract.readDigitalAsset(ctx, '1003').should.be.rejectedWith(/The digital asset 1003 does not exist/);
        });

    });

    describe('#updateDigitalAsset', () => {

        it('should update a digital asset', async () => {
            await contract.updateDigitalAsset(ctx, '1001', 'digital asset 1001 new value');
            ctx.stub.putState.should.have.been.calledOnceWithExactly('1001', Buffer.from('{"value":"digital asset 1001 new value"}'));
        });

        it('should throw an error for a digital asset that does not exist', async () => {
            await contract.updateDigitalAsset(ctx, '1003', 'digital asset 1003 new value').should.be.rejectedWith(/The digital asset 1003 does not exist/);
        });

    });

    describe('#deleteDigitalAsset', () => {

        it('should delete a digital asset', async () => {
            await contract.deleteDigitalAsset(ctx, '1001');
            ctx.stub.deleteState.should.have.been.calledOnceWithExactly('1001');
        });

        it('should throw an error for a digital asset that does not exist', async () => {
            await contract.deleteDigitalAsset(ctx, '1003').should.be.rejectedWith(/The digital asset 1003 does not exist/);
        });

    });

});