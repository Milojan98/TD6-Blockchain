pragma solidity >=0.4.25 <0.7.0;

contract ERC721 {


    // Events
    event Transfer(address from, address to, uint256 tokenId);
    event Approval(address owner, address approved, uint256 tokenId);

    // Required methods
    function balanceOf(address _owner) public view returns (uint256 balance);
    function ownerOf(uint256 _tokenId) external view returns (address owner);
 
    function transferFrom(address _from, address payable _to, uint256 _tokenId) external ;
    function transfer(address payable _to, uint256 _tokenId) external;
  
    function approve(address _to, uint256 _tokenId) external;
    function tokeOwnership(uint256 _tokenId) public;
  
    function totalSupply() public view returns (uint256 total);
    
 

}