//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

contract ANAC {
    uint8 public idade = 18;

    // Modificador de acesso que permite que apenas o proprietário do contrato execute a função
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function.");
        _;
    }

    // Evento para registrar a alteração da idade
    event IdadeSet(uint8 novaIdade);

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Função para definir a idade
    function setIdade(uint8 novaIdade) public onlyOwner {
        idade = novaIdade;
        emit IdadeSet(idade);
    }

    // Função para recuperar a idade
    function getIdade() public view returns (uint8) {
        return idade;
    }
}
