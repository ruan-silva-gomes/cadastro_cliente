//importe necessário do Material app
import 'package:flutter/material.dart';

class Cliente {
  final String nome;
  final String email;
  final String senha;

  //Construtor do cliente
  Cliente({
    required this.nome,
    required this.email,
    required this.senha,
  });
  @override
  String toString() {
    return 'Cliente: $nome, Email: $email';
  }
}

class GerenciadorClientes {
  //variavel estatica que guarda a unica copia desta classe 
  static final GerenciadorClientes _instancia = GerenciadorClientes._interno();
  //inpede a crianção de novas instancias
  GerenciadorClientes._interno();
//sempre retorna a isntancia existente
  factory GerenciadorClientes() => _instancia;
//lista <ul> que armazena todos clientes cadastrados
  final List<Cliente>_clientes = [];

  List<Cliente> get cliente => List.unmodifiable(_clientes);

  bool cadastrar(Cliente cliente){
    //vamos checar se ja existe um email cadastrado
    if(_clientes.any((c) => c.email.toLowerCase() == cliente.email.toLowerCase())){
      print('Erro: email ${cliente.email} ja cadastrado');
      return false;//Cadastro falhou
    }
    _clientes.add(cliente); //adiciona o cliente
    print('Novo cliente cadastrado: ${cliente.nome}');
    return true; //Cadatrooooouuu
  }
  Cliente ? login(String email, String senha){
    return _clientes.firstWhere(
       //é uma função anônima
       // o c representa cada elemento(cada cliente) da lista _clientes 
      (c) => c.email.toLowerCase() == email.toLowerCase() && c.senha == senha,
      orElse: () => Null as Cliente, //retorna nulo se nao encontra os dados
    );
  }
}