// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this");
        _;
    }
}


contract VotingSystem is Ownable {
 
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }


    mapping(uint => Candidate) public candidates;
    mapping(address => bool) public voters;

    uint public candidateCount;

 
    function addCandidate(string calldata _name) external onlyOwner {
        candidates[candidateCount] = Candidate(candidateCount, _name, 0);
        candidateCount++;
    }

  
    function vote(uint _candidateId) external {
        require(!voters[msg.sender], "You have already voted");
        require(_candidateId < candidateCount, "Invalid candidate ID");

        voters[msg.sender] = true;
        candidates[_candidateId].voteCount++;
    }


    function getCandidate(uint _candidateId) external view returns (string memory name, uint voteCount) {
        require(_candidateId < candidateCount, "Invalid candidate ID");

        Candidate storage candidate = candidates[_candidateId];
        return (candidate.name, candidate.voteCount);
    }

    // Get total number of candidates
    function getTotalCandidates() external view returns (uint) {
        return candidateCount;
    }
}
