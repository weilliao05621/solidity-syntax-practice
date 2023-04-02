// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

interface IERC20 {
    // token 的總餘額
    function totalSupply() external view returns (uint);

    // 查看一個帳號在此 contract 的 token 餘額
    function balanceOf(address account) external view returns (uint);

    // 一個帳號可以直接轉該 contract 的 token 給別的帳號
    function transfer(address recipient, uint amount) external returns (bool);

    // 查詢一個帳號允許另一個帳號使用多少該 contract 的 token
    function allowance(
        address owner,
        address spender
    ) external view returns (uint);

    // 一個帳號 （owner） 授權給另一個帳號（spender）能花前者多少的 token
    function approve(address spender, uint amount) external returns (bool);

    // 確認有 allowance 後，可以執行此帳號來達成 transfer
    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint amount);
    event Approval(address indexed owner, address indexed spender, uint amount);
}

contract WeilToken is IERC20 {
    uint public totalsupply;
    mapping(address => uint) public balanceof;
    mapping(address => mapping(address => uint)) public allowances;
    string public name = "Weil";
    string public symbol = "WEIL";
    // 比較特別的是，這邊知道是固定的 0 的數量且已經使用 uint8，為何不使用 constant，
    uint8 public constant decimals = 18;

    function totalSupply() external view returns (uint) {
        return totalsupply;
    }

    function balanceOf(address account) external view returns (uint) {
        return balanceof[account];
    }

    function transfer(address recipient, uint amount) external returns (bool) {
        balanceof[msg.sender] -= amount;
        balanceof[recipient] += amount;

        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function allowance(
        address owner,
        address spender
    ) external view returns (uint) {
        return allowances[owner][spender];
    }

    function approve(address spender, uint amount) external returns (bool) {
        allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool) {
        allowances[sender][msg.sender] -= amount;
        balanceof[sender] -= amount;
        balanceof[recipient] += amount;

        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    // 在 openzepplin 上，通常這些機制都是比較特別，像 mint 和 burn 是控制 token 的供應穩定
    function _mint(uint amount) private {
        balanceof[msg.sender] += amount;
        totalsupply += amount;

        emit Transfer(address(0), msg.sender, amount);
    }

    function _burn(uint amount) private {
        balanceof[msg.sender] += amount;
        totalsupply -= amount;

        emit Transfer(msg.sender, address(0), amount);
    }
}
