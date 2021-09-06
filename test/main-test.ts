import { expect } from 'chai';
import { ethers } from 'hardhat';
import 'hardhat-gas-reporter';
import { BigNumber, Contract } from 'ethers';
import { JsonRpcSigner } from '@ethersproject/providers';
import { network } from 'hardhat';
import '@nomiclabs/hardhat-waffle';
import fs from 'fs';
import { LootSwords } from '../typechain/LootSwords';
import { SignerWithAddress } from '@nomiclabs/hardhat-ethers/signers';
let owner: SignerWithAddress;
let addr1: SignerWithAddress;
let LootContract: LootSwords;

describe('Greeter', function () {
  it("Should return the new greeting once it's changed", async function () {
    const Greeter = await ethers.getContractFactory('LootSwords');
    const greeter = await Greeter.deploy('Hello, world!');
    await greeter.deployed();
  });
});
