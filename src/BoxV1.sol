//SPDX-License-Identitifer:MIT

pragma solidity ^0.8.18;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

//storage is stored in the proxy, NOT the implementation contract
//proxy --> deploy implmentation --> call some "initializer" function (Constructors are not used in proxy contracts )

contract BoxV1 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    uint256 internal number;

    //@custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize() public initializer {
        //use if we want to initial something
        __Ownable_init(msg.sender); //sets owner to mes.sender  (notice the double "_")
        __UUPSUpgradeable_init(); //doesnt really do anything but best practice to put it to say that this contract is UUPS
    }

    function getNumber() external view returns (uint256) {
        return number;
    }

    function version() external pure returns (uint256) {
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override {
        // if we wanted the owner to update the contract.. we add the code here
    }
}
