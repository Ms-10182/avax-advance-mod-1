// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
//function burn(uint amount,address _of)external; add this function in IERC20.sol
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Vault {

    IERC20 public v_gem;
    IERC20 public v_gold;
    uint public constant goldMineRate = 10;

    address public immutable owner;
    mapping(address=>bool) public isGoldMineActive;
    mapping(address=>uint) public goldMineTime;
    mapping(address=>uint) public goldCoins;
    mapping(address=>uint) public gemStones;
    mapping(address=>uint) public goldStakeBalance;

    enum Cards{rare,superRare,epic,mythic,legendary}

    struct PlayerCards{
        uint rare;
        uint superRare;
        uint epic;
        uint mythic;
        uint legendary;        
    }

    mapping (address=>PlayerCards) public playerCards;

    constructor(address gemToken,address goldToken){
        v_gem =IERC20(gemToken);
        v_gold =IERC20(goldToken);

        owner= msg.sender;
    }

    function startGoldMining() public  {
        goldMineTime[msg.sender] = block.timestamp;
        isGoldMineActive[msg.sender]=true;
    }

    function goldMineBalance()public view returns(uint){
        require(isGoldMineActive[msg.sender],"mining not active");
        uint totalTime = block.timestamp-goldMineTime[msg.sender];
        uint minedGold = goldMineRate * totalTime;
        return minedGold;
    }

    function claimGold()public {
        require(isGoldMineActive[msg.sender],"mining not started");
        uint totalTime = block.timestamp-goldMineTime[msg.sender];
        uint minedGold = goldMineRate * totalTime;


        goldCoins[msg.sender]+=minedGold;
        goldMineTime[msg.sender]= block.timestamp;

    }

    function battle()public{
        require(goldCoins[msg.sender]>=20);
        goldCoins[msg.sender]-=20;
        uint randomNum = block.timestamp%10;
        if(randomNum%2 ==0){
            //won the battle
            goldCoins[msg.sender]+=100;
        }
        
    }

    function tradeGems(uint _noOfCoins)public{
        require(goldStakeBalance[msg.sender]==0,"already traded, collect gems first");
        require(_noOfCoins>0,"must be greater than zero");
        goldStakeBalance[msg.sender]+=_noOfCoins;
        bool success = v_gold.transferFrom(owner, address(this), _noOfCoins);
        require(success,"transaction failed");  
        goldCoins[msg.sender]-=_noOfCoins;
    }

    function withdrawGems()public{
        require(goldStakeBalance[msg.sender]>0,"no staked gold");
        uint gemVal =goldStakeBalance[msg.sender]/10;
        goldStakeBalance[msg.sender]=0;
        bool success =v_gem.transferFrom(owner,msg.sender, gemVal);
        require(success,"withdrawl failed");
        gemStones[msg.sender]+=gemVal;
    }

    function transferGems(address to, uint amount) public {
        require(to != address(0), "Invalid address");
        require(v_gem.balanceOf(msg.sender) >= amount, "Insufficient gem tokens");
        
        v_gem.approve(address(this), amount);

        bool success = v_gem.transferFrom(msg.sender, to, amount);
        require(success, "Token transfer failed");
        gemStones[to]+=amount;
    }

    function redeemCards( Cards _card)public{
        if(_card == Cards.rare){

            require(goldCoins[msg.sender]>=10,"Low degen");
            playerCards[msg.sender].rare +=1;
            v_gem.burn(10,msg.sender);
            gemStones[msg.sender]-=10;

        }else if(_card == Cards.superRare){

            require(goldCoins[msg.sender]>=20,"Low degen");
            playerCards[msg.sender].superRare +=1;
            v_gem.burn(20,msg.sender);
            gemStones[msg.sender]-=20;

        }else if(_card == Cards.epic){

            require(goldCoins[msg.sender]>=30,"Low degen");
            playerCards[msg.sender].epic +=1;
            v_gem.burn(30,msg.sender);
            gemStones[msg.sender]-=30;

        }else if(_card == Cards.mythic){

            require(goldCoins[msg.sender]>=40,"Low degen");
            playerCards[msg.sender].mythic +=1;
            v_gem.burn(40,msg.sender);
            gemStones[msg.sender]-=40;

        }else if(_card == Cards.legendary){

            require(goldCoins[msg.sender]>=50,"Low degen");
            playerCards[msg.sender].legendary +=1;
            v_gem.burn(50,msg.sender);
            gemStones[msg.sender]-=50;

        }else{
            revert("invalid card selected");
        }
    }   
}
