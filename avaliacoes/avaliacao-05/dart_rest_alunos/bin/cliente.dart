import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> main() async {
  final url = Uri.parse('http://localhost:8080/alunos');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final dados = jsonDecode(response.body);
    final List<dynamic> alunos = dados['alunos'];

    print('ID NOME DISCIPLINA MEDIA FALTAS MENSAGEM');

    for (final aluno in alunos) {
      final int id = aluno['id'];
      final String nome = aluno['nome'];
      final String disciplina = aluno['disciplina'];
      final double media = (aluno['media'] as num).toDouble();
      final int faltas = aluno['faltas'];

      String mensagem;

      if (faltas > 20) {
        mensagem = 'Reprovado por Faltas';
      } else if (media < 6.0) {
        mensagem = 'Reprovado';
      } else {
        mensagem = 'Aprovado';
      }

      print('$id $nome $disciplina $media $faltas $mensagem');
    }
  } else {
    print('Erro ao acessar o servidor: ${response.statusCode}');
  }
}