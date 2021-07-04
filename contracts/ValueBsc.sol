// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import './Value.sol';
import './BridgeBase.sol';
import './TokenBsc.sol';

contract ValueBsc is Value {
    constructor(address token) Value(new BridgeBase(token), 'BSC Token', new TokenBsc())
    {}
}
