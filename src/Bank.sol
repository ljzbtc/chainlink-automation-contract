// SPDX-License-Identifier:MIT
pragma solidity ^0.8.19;

interface AutomationCompatibleInterface {
    function checkUpkeep(bytes calldata checkData) external returns (bool upkeepNeeded, bytes memory performData);
    function performUpkeep(bytes calldata performData) external;
}

/// @author liujingze
/// @dev  bank
contract Bank is AutomationCompatibleInterface {

    mapping(address => uint) public AddressToAmount;
    address payable public BANK_OWER;

    constructor() {
        BANK_OWER = payable(msg.sender);
    }

    function withdraw() public {
        require(msg.sender == BANK_OWER, "Only owner can withdraw");
        BANK_OWER.transfer(address(this).balance);
    }

    function deposited() public payable {
        AddressToAmount[msg.sender] += msg.value;
    }

    function checkUpkeep(bytes calldata /* checkData */) external view override returns (bool upkeepNeeded, bytes memory performData) {
        uint bankBalance = address(this).balance;
        upkeepNeeded = bankBalance >= 0.1 ether;
        performData = abi.encode(bankBalance);
        return (upkeepNeeded, performData);
    }

    function performUpkeep(bytes calldata performData) external override {
        uint bankBalance = abi.decode(performData, (uint));
        require(bankBalance >= 0.1 ether, "Insufficient bank balance");

        uint halfAmount = bankBalance / 2;
        (bool success, ) = BANK_OWER.call{value: halfAmount}("");
        require(success, "Transfer to owner failed");
    }

    receive() external payable {
        deposited();
    }

    fallback() external payable { }
}