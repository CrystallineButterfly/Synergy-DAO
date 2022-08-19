pragma solidity ^0.8.9;

// Synergy DAO = DAO, that builds site via agreement with the user. 

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";


absract contract SynergyDAO {
    // Contract will be upgradable upon agreement with the user, given certain contraints
    constructor(address _owner) public {
        owner = _owner;
    }
}


contract SynergyDAO is Initializable, ERC721Upgradeable, UUPSUpgradeable, OwnableUpgradeable   {
    // Note how we created an initialize function and then added the
    // initializer modifier which ensure that the
    // initialize function is only called once
    function initialize() public initializer  {
        // Note how instead of using the ERC721() constructor, we have to manually initialize it
        // Same goes for the Ownable contract where we have to manually initialize it
        __ERC721_init("---", "---");
        __Ownable_init();
        _mint(msg.sender, 1);
    }
    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {

    }
}
