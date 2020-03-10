pragma solidity >=0.4.25 <0.7.0;

contract Breeder{
    
    mapping(address => bool) breederList;

    event AddedToBreederList(address indexed account);
    event RemovedFromBreederList(address indexed account);
    
    modifier OnlyBreederListed(){
        require(isABreeder(msg.sender));
        _;
    }

    /**
   * Add an address in the breeder list. 
   */

    function registerBreeder(address _breeder) public{
        require(breederList[_breeder]==false);
        breederList[_breeder]=true;
        emit AddedToBreederList(_breeder);
    }

   /**
   * Remove an address from the breeder list. 
   */

    function removeBreeder(address _breeder) public{
        require(breederList[_breeder]==true);
        breederList[_breeder] = false;
        emit RemovedFromBreederList(_breeder);
    }

    /**
   * Check if an address is in the breeder list.
   */

    function isABreeder(address _breeder) public view returns(bool){
        return breederList[_breeder];
    }

}