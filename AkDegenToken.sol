
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";

// import "./ERC20.sol";

contract AkDegenToken is ERC20 {

    struct Item{
        uint id;
        string name;
        uint price;
    }

    mapping(uint256 => Item) public items;
    uint public nextItemId;

    address owner = msg.sender;

    modifier onlyOwner {
        require(owner == msg.sender, "only owner can access conrract");
        _;
    }
     constructor(string memory name, string memory symbol) ERC20(name, symbol)  {
        // Mint 100 tokens to msg.sender
        // Similar to how
        // 1 dollar = 100 cents
        // 1 token = 1 * (10 ** decimals)

        _mint(msg.sender, 100 * 10 ** uint(decimals()));
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // function to onwer can transfer tokens 

    function Transfer_token(address account, uint256 value) external {
        _transfer(msg.sender, account, value);
    }

    // function to check their balance at any time
    function Token_balance() external view  returns (uint256){
        return  balanceOf(msg.sender);
    }

    // function to burn their token no longeer needed
    function Token_burn(address account, uint256 value) external {
        _burn(account, value);
    }
//  befor redem funciton we need to add some items in our game

    function addItems(string memory name, uint price) public onlyOwner{
        items[nextItemId] = Item(nextItemId,name,price);
        nextItemId++;
    }
    //function to reedem  all tokens or items
    function redeem_items(uint itemID) public {
        Item memory item = items[itemID];
        require(balanceOf(msg.sender) >= item.price,"insuffiecent balance to reddeem");
        _burn(msg.sender,item.price);
    }

}
