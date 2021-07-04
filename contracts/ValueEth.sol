// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import './Value.sol';
import './BridgeBase.sol';
import './TokenEth.sol';

contract ValueEth is Value {
    constructor(address token) Value(new BridgeBase(token), 'ETH Token', new TokenEth())
    {}
}
