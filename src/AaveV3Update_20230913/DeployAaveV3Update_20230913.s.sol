// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovHelpers} from 'aave-helpers/GovHelpers.sol';
import {
  EthereumScript,
  ArbitrumScript,
  OptimismScript,
  PolygonScript,
  AvalancheScript
} from 'aave-helpers/ScriptUtils.sol';
import {
  AaveV3ArbitrumUpdate20230913Payload,
  AaveV3OptimismUpdate20230913Payload,
  AaveV3PolygonUpdate20230913Payload,
  AaveV3AvalancheUpdate20230913Payload
} from './AaveV3Update_20230913.sol';

contract CreateProposal is EthereumScript {
  function run() external broadcast {
    GovHelpers.Payload[] memory payloads = new GovHelpers.Payload[](3);
    payloads[0] = GovHelpers.buildArbitrum(0x32f3A6134590fc2d9440663d35a2F0a6265F04c4);
    payloads[1] = GovHelpers.buildOptimism(0x0568a3aeb8E78262dEFf75ee68fAC20ae35ffA91);
    payloads[2] = GovHelpers.buildPolygon(0xf7C3350757DE224bdB2b77A3943C8667aCEE3d37);
    GovHelpers.createProposal(payloads, 0x6df20d3eaefc2ad3a546f40ede47bf67b60a85d13bdd2efff2bcce73966755dc);
  }
}

contract Deploy20230913PayloadArbitrum is ArbitrumScript {
  function run() external broadcast {
    new AaveV3ArbitrumUpdate20230913Payload();
  }
}

contract Deploy20230913PayloadOptimism is OptimismScript {
  function run() external broadcast {
    new AaveV3OptimismUpdate20230913Payload();
  }
}

contract Deploy20230913PayloadPolygon is PolygonScript {
  function run() external broadcast {
    new AaveV3PolygonUpdate20230913Payload();
  }
}

contract Deploy20230913PayloadAvalanche is AvalancheScript {
  function run() external broadcast {
    new AaveV3AvalancheUpdate20230913Payload();
  }
}
