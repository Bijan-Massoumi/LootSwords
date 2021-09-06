import '@nomiclabs/hardhat-waffle';
import '@typechain/hardhat';
import '@nomiclabs/hardhat-ethers';
import 'hardhat-contract-sizer';
import 'hardhat-gas-reporter';

import secret from './secrets';
// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  // gasReporter: {
  //   enabled: true,
  //   currency: 'ETH',
  // },
  solidity: {
    version: '0.8.0',
    settings: {
      optimizer: {
        enabled: true,
        runs: 100,
      },
    },
  },
  networks: {
    hardhat: {
      forking: {
        url: secret.url,
        blockNumber: secret.blockNumber,
      },
    },
  },
};
