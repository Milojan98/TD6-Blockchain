pragma solidity >=0.4.25 <0.7.0;

import "./AnimalLand.sol";
import "./AnimalOwnership.sol";

contract AnimalBAttle is AnimalLand, AnimalOwnership {

event AnimalWin(uint256 animalId );

mapping (uint256=>bool) public animalReandyToFight;
mapping(uint256=>uint256) public amountToFight;


/*
**Battle against two Animals.
**We are for the peace so the breeder who call this function to fight lose his money and animal :)
*/

function ToFight(uint256 _animalId, uint256 _targetId) public payable OnlyBreederListed(){
    require(animalToOwner[_animalId]==msg.sender);
    require(isAnimalReadyToFight(_targetId)==true);
    uint256 amount= theAmountToFight(_targetId);
    require(msg.value== amount);
    deadAnimal(_animalId);
    TransferMoneyWin(animalToOwner[_targetId], theAmountToFight(_targetId));
    emit BurnAnimal(_animalId);
    emit AnimalWin(_targetId);
}

/*
**Register your animal in the Arena.
*/

function ReadyToFight(uint256 _animalId,uint256 _amount) public payable OnlyBreederListed(){
    require(animalToOwner[_animalId]==msg.sender);
    require(msg.value==_amount);
    animalReandyToFight[_animalId]=true;
    amountToFight[_animalId]=_amount;
    
}

/*
**Return true if the animal is on the list of fighter.
*/

function isAnimalReadyToFight(uint256 _animalId) OnlyBreederListed() public view returns(bool){
    return animalReandyToFight[_animalId];
}

/*
**Show you the amount that you have to pay to fight against this animal.
*/

function theAmountToFight(uint256 _animalId) public view returns(uint256){
    return amountToFight[_animalId];
}

/*
**Function to pay Winner 
*/

function TransferMoneyWin(address payable _address, uint256 _amount) public payable OnlyBreederListed(){
    _address.transfer(2*_amount); 
}
}