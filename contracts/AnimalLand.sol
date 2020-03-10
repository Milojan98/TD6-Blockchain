pragma solidity >=0.4.25 <0.7.0;

import "./Breeder.sol";

contract AnimalLand is Breeder{

    event NewAnimal(uint256 animalId,string tipe,string name);
    event BurnAnimal(uint256 animalId);

    mapping (uint => address payable) public animalToOwner;
    mapping (address => uint) ownerAnimalCount;

    Animal[] public animals;     //Listed all Animals created.

    struct Animal{
        uint256 animalId;
        string tipe;    //type(cat,dog,cow...)
        string sexe;
        string name;
        string color;
        uint8 nb_paws;

    }

    /*
    **Declare your animal.
    */

    function declareAnimal(string memory _tipe, string memory _sexe, string memory _name,string memory _color,uint8 _nb_paws ) 
    internal OnlyBreederListed(){

        uint256 animalId=animals.length;
        animals.push(Animal(animalId,_tipe,_sexe,_name,_color,_nb_paws));
        animalToOwner[animalId] = msg.sender;
        ownerAnimalCount[msg.sender]++;
        emit NewAnimal(animalId, _tipe ,_name);
    }


}