// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovHelpers} from 'aave-helpers/GovHelpers.sol';
import {
  EthereumScript,
  ArbitrumScript,
  PolygonScript,
  AvalancheScript,
  OptimismScript
} from 'aave-helpers/ScriptUtils.sol';
import {
  AaveV3ArbitrumUpdate20230502Payload,
  AaveV3PolygonUpdate20230502Payload,
  AaveV3AvalancheUpdate20230502Payload,
  AaveV3OptimismUpdate20230502Payload
} from './AaveV3Update_20230502.sol';

contract CreateProposal is EthereumScript {
  function run() external broadcast {
    GovHelpers.Payload[] memory payloads = new GovHelpers.Payload[](3);
    payloads[0] = GovHelpers.buildArbitrum(0x142DCAEC322aAA25141B2597bf348487aDBd596d);
    payloads[1] = GovHelpers.buildPolygon(0x24bdAcf6bbEBAf567123Da16CDb79A266597e92B);
    payloads[2] = GovHelpers.buildOptimism(0xF22c8255eA615b3Da6CA5CF5aeCc8956bfF07Aa8);
    GovHelpers.createProposal(payloads, 0x597779e8a7564df81730fbb0522ee52147427851c335df92bc297d332de34dc2);
  }
}

contract Deploy20230502PayloadArbitrum is ArbitrumScript {
  function run() external broadcast {
    new AaveV3ArbitrumUpdate20230502Payload();
  }
}

contract Deploy20230502PayloadPolygon is PolygonScript {
  function run() external broadcast {
    new AaveV3PolygonUpdate20230502Payload();
  }
}

contract Deploy20230502PayloadAvalanche is AvalancheScript {
  function run() external broadcast {
    new AaveV3AvalancheUpdate20230502Payload();
  }
}

contract Deploy20230502PayloadOptimism is OptimismScript {
  function run() external broadcast {
    new AaveV3OptimismUpdate20230502Payload();
  }
}
