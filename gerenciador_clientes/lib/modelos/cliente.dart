// Importe nescessario do Material APP
import 'package:flutter/material.dart';

class Cliente {
  final String nome;
  final String email;
  final String senha;

  // Contrutor da classe Cliente
  Cliente({required this.nome, required this.email, required this.senha});

  @override
  String toString() {
    return 'Cliente(nome: $nome, email: $email, senha: $senha)';
  }
}

class GerenciadorClientes {
  // variavel estatica que guarda a unica copia desta classe
  static final GerenciadorClientes _instancia = GerenciadorClientes._interno();

  // Impede a crianção de multiplas instancias
  GerenciadorClientes._interno();

  //  sempre retorna a mesma instancia
  factory GerenciadorClientes() {
    return _instancia;
  }

  // lista ul que armazena todos os clientes cadastrados
  final List<Cliente> _clientes = [];

  //para acessar a lista de clientes (retorna uma copia imutavel)
  List<Cliente> get clientes =>
      List.unmodifiable(_clientes); //unmodifiable sem modifica a lista

  //tentar cadastrar um novo cliente
  bool cadastrar(Cliente cliente) {
    // vamos checar se ja existe um cliente com o mesmo email
    if (_clientes.any(
      (c) => c.email.toLowerCase() == cliente.email.toLowerCase(),
    )) {
      print(
        "Erro: Ja existe um cliente cadastrado com este email ${cliente.email}",
      );
      return false; // cadastro falhou
    }
    _clientes.add(cliente); //vou adicionar o cliente
    print("Cliente cadastrado com sucesso: ${cliente.nome}");
    return true; //cadastro bem sucedido
  }

  Cliente? login(String email, String senha){
    return _clientes.firstWhere(
      // é uma função anonima representa cada cliente na lista dado o nome de (c)
      // o c representa  elemento (cada cliente) da lista _clientes
      (c) => c.email.toLowerCase() == email.toLowerCase() && c.senha == senha,
      orElse: () => null as Cliente, //ele retorna null se nao encontrar
    );
  }
}
