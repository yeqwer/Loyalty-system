// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./Seller.sol";

contract Loyalty is Seller {

  struct Session { 
    address loyaltyUser;
    uint loyaltyCoins;
  }

  Session[] public sessions;

  mapping(uint => Session) public sessionsById;

  event CreatedNewSession(uint sessionId);
  event SessionComplete(address user, uint sessionId);

  function createSession(address _user, uint _loyaltyCoins) external onlySeller { //only company
    sessions.push(Session(_user, _loyaltyCoins));
    uint id = sessions.length - 1;
    sessionsById[id] = sessions[id];
    
    emit CreatedNewSession(id);
  }

  function confirmByUser(uint _sessionId) external { //if we have purchase in map
    require(sessionsById[_sessionId].loyaltyUser  == msg.sender);
    //Transfer loyalty coins to user
    emit SessionComplete(msg.sender, _sessionId);
  }
}