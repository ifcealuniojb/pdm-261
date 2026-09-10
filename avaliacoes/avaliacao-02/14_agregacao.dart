// 14-agregacao.dart

// Agregação e Composição

import 'dart:convert';

// Biblioteca utilizada para trabalhar com jsonEncode().

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }
  //JSON.
  Map toJson() => {'nome': _nome};
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }
  //JSON.
  Map toJson() => {'nome': _nome, 'dependentes': _dependentes};
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }
  //JSON.
  Map toJson() => {'nomeProjeto': _nomeProjeto, 'funcionarios': _funcionarios};
}

void main() {
  // 1. Criar varios objetos Dependentes

  Dependente dependente1 = Dependente('Ana');
  Dependente dependente2 = Dependente('Pedro');
  Dependente dependente3 = Dependente('Maria');
  Dependente dependente4 = Dependente('Lucas');

  // 2. Criar varios objetos Funcionario

  Funcionario funcionario1 = Funcionario('Joao', []);
  Funcionario funcionario2 = Funcionario('Carlos', []);

  // 3. Associar os Dependentes criados aos respectivos funcionarios

  funcionario1._dependentes.add(dependente1);
  funcionario1._dependentes.add(dependente2);
  funcionario2._dependentes.add(dependente3);
  funcionario2._dependentes.add(dependente4);

  // 4. Criar uma lista de Funcionarios

  List<Funcionario> funcionarios = [];
  funcionarios.add(funcionario1);
  funcionarios.add(funcionario2);

  // 5. criar um objeto Equipe Projeto chamando o metodo
  // contrutor que da nome ao projeto e insere uma
  // coleção de funcionario

  EquipeProjeto equipeProjeto = EquipeProjeto('Projeto Mobile', funcionarios);

  // 6. Printar no formato JSON o objeto Equipe Projeto.
  String equipeJson = jsonEncode(equipeProjeto);
  print(equipeJson);
}
