// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// ----------------------------------------------------------------------------
// ERC Token Standard #20 Interface
//
// ----------------------------------------------------------------------------
interface ERC20Interface {
    function totalSupply() external view returns (uint);
    function balanceOf(address tokenOwner) external view returns (uint balance);
    function allowance(address tokenOwner, address spender) external view returns (uint remaining);
    function transfer(address to, uint tokens) external returns (bool success);
    function approve(address spender, uint tokens) external returns (bool success);
    function transferFrom(address from, address to, uint tokens) external returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

// // ----------------------------------------------------------------------------
// Safe Math Library
// ----------------------------------------------------------------------------
contract SafeMath {
    
    function safeAdd(uint a, uint b) public pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
    
    function safeSub(uint a, uint b) public pure returns (uint c) {
        require(b <= a); 
        c = a - b; 
    } 
    
    function safeMul(uint a, uint b) public pure returns (uint c) 
    { 
        c = a * b; 
        require(a == 0 || c / a == b);
    } 
    
    function safeDiv(uint a, uint b) public pure returns (uint c) 
    { 
        require(b > 0);
        c = a / b;
    }
}


contract MyToken is  ERC20Interface, SafeMath {
    string public name;
    string public symbol;
    uint256 public decimals; // 18 decimals is the strongly suggested default, avoid changing it

    uint256 public _totalSupply;

    // event Transfer(address indexed from, address indexed to, uint tokens);
    // event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;

    /**
     * Constrctor function
     *
     * Initializes contract with initial supply tokens to the creator of the contract
     */
    constructor() {
        name = "Zia";
        symbol = "ZIA";
        decimals = 6;
        _totalSupply = 1000000000000 * 10**decimals;

        balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    address public tokenAdd = address(this);

    function totalSupply() public view returns (uint256) {
        return _totalSupply  - balances[address(0)];
    }

    function decimal() public view returns(uint256){
        return decimals;
    }

    function balanceOf(address tokenOwner) public view returns (uint balance) {
        return balances[tokenOwner];
    }

    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }

    function approve(address spender, uint tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }

    function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] = safeSub(balances[msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Transfer(msg.sender, to, tokens);
        return true;
    }

    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        balances[from] = safeSub(balances[from], tokens);
        allowed[from][msg.sender] = safeSub(allowed[from][msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Transfer(from, to, tokens);
        return true;
    }
}

// contract Crud {
//   struct User {
//     uint id;
//     string name;
//   }
//   User[] public users;
//   uint public nextId = 1;

//   function create(string memory name) public {
//     users.push(User(nextId, name));
//     nextId++;
//   }

//   function read(uint id) view public returns(uint, string memory) {
//     uint i = find(id);
//     return(users[i].id, users[i].name);
//   }

//   function update(uint id, string memory name) public {
//     uint i = find(id);
//     users[i].name = name;
//   }

//   function destroy(uint id) public {
//     uint i = find(id);
//     delete users[i];
//   }

//   function find(uint id) view internal returns(uint) {
//     for(uint i = 0; i < users.length; i++) {
//       if(users[i].id == id) {
//         return i;
//       }
//     }
//     revert('User does not exist!');
//   }

// }
// contract Simple {
//     uint[] public data;

//     function setData(uint d) public {
//         data.push(d);
//     }
//     function getData(uint i) public view returns (uint){
//         return data[i];
//     }
//     function getAll() public view returns (uint[] memory){
//         return data;
//     }
//     function length() public view returns (uint){
//         return data.length;
//     }
// }