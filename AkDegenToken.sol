// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "ERC20.sol";
import "Strings.sol";

contract Mtoken is ERC20 {
    address owner = msg.sender;
    
    modifier onlyOwner { 
        require (owner == msg.sender, "only owner can access");
        _;
    }
    constructor(string memory name, string memory symbol) ERC20(name, symbol) onlyOwner{} 

    string items = "1. BUNDLE , 2. GUN SKIN , 3. SHIRT , 4. PANT , 5. GOOGLES";
    string BUNDLE = "YOU REDEEMED BUNDLE.";
    string GUN_SKIN = "YOU REDEEMED GUN SKIN";
    string SHIRT = "YOU REDEEMED SHIRT.";
    string PANT = "YOU REDEEMED PANT.";
    string GOOGLES = "YOU REDEEMED GOOGLES.";
    string NONE = "PLEASE CHOOSE VALUE FROM ITEMS.";
    mapping(address => string) public redeemed_items;
    mapping(address => uint256) public count;
    uint256[5] price_of_item = [200,150,100,75,50];
    

    function check_items() external view returns (string memory){
        return items;
    }

    function redeem_items(uint256 item_number,uint256 number_of_item) external returns(string memory){
        require(item_number == 1 || item_number == 2 || item_number == 3 || item_number == 4 || item_number == 5, "PLEASE CHOOSE VALUE FROM ITEMS.");
        count[msg.sender]++;
        if(count[msg.sender] == 1){
            if(item_number == 1){
                uint256 amount = price_of_item[item_number - 1]*number_of_item;
                require(_balances[msg.sender] >= amount, "Item price exceeds balance of player");
                _balances[msg.sender] -= amount;
                redeemed_items[msg.sender] = string.concat(redeemed_items[msg.sender], "BUNDLE : " , Strings.toString(number_of_item));              
                return BUNDLE;
            }
            else if(item_number == 2){
                uint256 amount = price_of_item[item_number - 1]*number_of_item;
                require(_balances[msg.sender] >= amount, "Item price exceeds balance of player");
                _balances[msg.sender] -= amount;
                redeemed_items[msg.sender] = string.concat(redeemed_items[msg.sender], "GUN_SKIN : ", Strings.toString(number_of_item));
                return GUN_SKIN;
            }
            else if(item_number == 3){
                uint256 amount = price_of_item[item_number - 1]*number_of_item;
                require(_balances[msg.sender] >= amount, "Item price exceeds balance of player");
                _balances[msg.sender] -= amount;
                redeemed_items[msg.sender] = string.concat(redeemed_items[msg.sender], "SHIRT : ", Strings.toString(number_of_item));
                return SHIRT;
            }
            else if(item_number == 4){
                uint256 amount = price_of_item[item_number - 1]*number_of_item;
                require(_balances[msg.sender] >= amount, "Item price exceeds balance of player");
                _balances[msg.sender] -= amount;
                redeemed_items[msg.sender] = string.concat(redeemed_items[msg.sender], "PANT : ", Strings.toString(number_of_item));
                return PANT;
            }
            else if(item_number == 5){
                uint256 amount = price_of_item[item_number - 1]*number_of_item;
                require(_balances[msg.sender] >= amount, "Item price exceeds balance of player");
                _balances[msg.sender] -= amount;
                redeemed_items[msg.sender] = string.concat(redeemed_items[msg.sender], "GOOGLES : ", Strings.toString(number_of_item));
                return GOOGLES;
            }
            else{
                return NONE;
            }
        }
        else {
            if(item_number == 1){
                uint256 amount = price_of_item[item_number - 1]*number_of_item;
                require(_balances[msg.sender] >= amount, "Item price exceeds balance of player");
                _balances[msg.sender] -= amount;
                redeemed_items[msg.sender] = string.concat(redeemed_items[msg.sender], " , BUNDLE : ", Strings.toString(number_of_item));
                return BUNDLE;
            }
            else if(item_number == 2){
                uint256 amount = price_of_item[item_number - 1]*number_of_item;
                require(_balances[msg.sender] >= amount, "Item price exceeds balance of player");
                _balances[msg.sender] -= amount;
                redeemed_items[msg.sender] = string.concat(redeemed_items[msg.sender], " , GUN_SKIN : ", Strings.toString(number_of_item));
                return GUN_SKIN;
            }
            else if(item_number == 3){
                uint256 amount = price_of_item[item_number - 1]*number_of_item;
                require(_balances[msg.sender] >= amount, "Item price exceeds balance of player");
                _balances[msg.sender] -= amount;
                redeemed_items[msg.sender] = string.concat(redeemed_items[msg.sender], " , SHIRT : ", Strings.toString(number_of_item));
                return SHIRT;
            }
            else if(item_number == 4){
                uint256 amount = price_of_item[item_number - 1]*number_of_item;
                require(_balances[msg.sender] >= amount, "Item price exceeds balance of player");
                _balances[msg.sender] -= amount;
                redeemed_items[msg.sender] = string.concat(redeemed_items[msg.sender], " , PANT : ", Strings.toString(number_of_item));
                return PANT;
            }
            else if(item_number == 5){
                uint256 amount = price_of_item[item_number - 1]*number_of_item;
                require(_balances[msg.sender] >= amount, "Item price exceeds balance of player");
                _balances[msg.sender] -= amount;
                redeemed_items[msg.sender] = string.concat(redeemed_items[msg.sender], " , GOOGLES : ", Strings.toString(number_of_item));
                return GOOGLES;
            }
            else{
                return NONE;
            }
        }
    }

    function token_mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function token_transfer(address account,uint256 value) external  {
        _transfer(msg.sender, account, value);
    }

    function token_burn(address account, uint256 value) external {
        _burn(account, value);
    }

    function token_balance() external view  returns (uint256){
        return  balanceOf(msg.sender);
    }

}
