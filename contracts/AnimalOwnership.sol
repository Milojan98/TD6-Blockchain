pragma solidity >=0.4.25 <0.7.0;

import "./ERC721.sol";
import "./AnimalLand.sol";

contract AnimalOwnership is ERC721, AnimalLand {

    mapping (uint256=>address) public animalApprovals;

    /*
    ** Function to know how many animal(s) have an owner.
    */
    
    function balanceOf(address _owner) public view returns (uint256 balance){
        return ownerAnimalCount[_owner];
    }


    /*
    ** Function to know the owner of an animal.
    */

    function ownerOf(uint256 _tokenId) external view returns (address owner){

        return animalToOwner[_tokenId];
    }



    /*
    ** Function to transfer an animal from an owner to someone else.
    */
    
    function transferFrom(address _from, address payable _to, uint256 _tokenId) public{
        animalToOwner[_tokenId]=_to;
        ownerAnimalCount[_to]++;
        ownerAnimalCount[_from]--;
        emit Transfer(_from,_to,_tokenId);
    }



    /*
    ** Function to transfer your animal to someone.
    */

    function transfer(address payable _to, uint256 _tokenId) public{
        require(animalToOwner[_tokenId]==msg.sender);
        transferFrom(msg.sender,_to,_tokenId);
    }




    /*
    ** Allow to an owner to take an animal from you.
    */

    function approve(address _to, uint256 _tokenId) external{
        require(animalToOwner[_tokenId]==msg.sender);
        animalApprovals[_tokenId]=_to;
        emit Approval(msg.sender,_to,_tokenId);


    }


    /*
    ** Function to recover your animal given by the previous function.
    */

    function tokeOwnership(uint256 _tokenId) public{
        require(msg.sender==animalApprovals[_tokenId]);
        address owner=animalToOwner[_tokenId];
        transferFrom(owner,msg.sender,_tokenId);

    }


    /*
    ** Show how many animals have been created.
    */

    function totalSupply() public view returns (uint256 total){
        return animals.length;
    }



    /*
    ** Function to burn your token (animal).
    */

    function deadAnimal(uint256 _animalId) public OnlyBreederListed{
        require(msg.sender==animalToOwner[_animalId]);
        ownerAnimalCount[msg.sender]--;
        animalToOwner[_animalId]=address(0);
        transfer(address(0),_animalId);
        emit BurnAnimal(_animalId);
    }
    
}