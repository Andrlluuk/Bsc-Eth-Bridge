// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import './TokenBase.sol';
import './BridgeBase.sol';
import './TokenBase.sol';

contract Value {
    BridgeBase private _bridge;
    string private _name;
    TokenBase private _token;

    constructor(BridgeBase bridge, string memory name, TokenBase token) {
        _bridge = bridge;
        _name = name;
        _token = token;
    }

    function send(address from, address to, uint amount, uint nonce, bytes calldata signature) external {
        _token.block(from, amount);
        _bridge.sendToken(to, amount, nonce, signature);
    }

    function receive(address to, uint amount) external {
        _token.unblock(to, amount);
    }
}
