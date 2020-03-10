pragma solidity >=0.4.25 <0.7.0;

import "./AnimalLand.sol";
import "./StringUtils.sol";   //Librairy to compare two strings

contract Offspring is AnimalLand{

    mapping(uint256 => bool ) ableToOffspring;

    /*
    ** Declare the offspring of two animals.
    **In the first time we check if the two animals are in the same type of animal (cat,dog,..) and with different sexe.
    */

    function BreedAnimal(uint256 _animalId,uint256 _animalId2) public {
        require(isAbleToOffspring(_animalId)==true);
        require(isAbleToOffspring(_animalId2)==true);
        require(StringUtils.equal(animals[_animalId].tipe,animals[_animalId2].tipe));
        require(StringUtils.equal(animals[_animalId].sexe,animals[_animalId2].sexe));
        declareAnimal(animals[_animalId].tipe,animals[_animalId2].sexe,string(abi.encodePacked(animals[_animalId].name,animals[_animalId2].name)),animals[_animalId2].color,animals[_animalId].nb_paws);
    }


    /*
    **Breeders able to declare the availability of offspring of his animal.
    */

    function readyToOffspring(uint256 _animalId) public {
        require(animalToOwner[_animalId]==msg.sender);
        ableToOffspring[_animalId]=true;
    }


    /*
    **Schow if the animal is in the list of offspring.
    */

    function isAbleToOffspring(uint256 _animalId) public view returns(bool) {
        return ableToOffspring[_animalId];
    }
}