import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

class Aluno {
  final int id;
  final String nome;
  final String disciplina;
  final double media;
  final int faltas;

  const Aluno({
    required this.id,
    required this.nome,
    required this.disciplina,
    required this.media,
    required this.faltas,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'disciplina': disciplina,
      'media': media,
      'faltas': faltas,
    };
  }
}

final List<Aluno> alunos = [
  const Aluno(
    id: 1,
    nome: 'Ana Souza',
    disciplina: 'Programação para Dispositivos Móveis',
    media: 8.0,
    faltas: 10,
  ),
  const Aluno(
    id: 2,
    nome: 'Bruno Lima',
    disciplina: 'Programação para Dispositivos Móveis',
    media: 5.5,
    faltas: 12,
  ),
  const Aluno(
    id: 3,
    nome: 'Carla Mendes',
    disciplina: 'Programação para Dispositivos Móveis',
    media: 7.0,
    faltas: 25,
  ),
  const Aluno(
    id: 4,
    nome: 'Diego Oliveira',
    disciplina: 'Programação para Dispositivos Móveis',
    media: 9.0,
    faltas: 5,
  ),
];

Response respostaJson(
  dynamic dados, {
  int statusCode = HttpStatus.ok,
}) {
  return Response(
    statusCode,
    body: jsonEncode(dados),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    },
  );
}

Response alunoNaoEncontrado() {
  return respostaJson(
    {
      'erro': 'Aluno não encontrado',
    },
    statusCode: HttpStatus.notFound,
  );
}

Router criarRotas() {
  final router = Router();

  router.get('/', (Request request) {
    return respostaJson({
      'aplicacao': 'API REST de alunos',
      'versao': '1.0.0',
      'rotas': {
        'listar_alunos': 'GET /alunos',
        'buscar_aluno': 'GET /alunos/<id>',
      },
    });
  });

  router.get('/alunos', (Request request) {
    final nome = request.url.queryParameters['nome'];
    final disciplina = request.url.queryParameters['disciplina'];

    Iterable<Aluno> resultado = alunos;

    if (nome != null && nome.trim().isNotEmpty) {
      final nomeBusca = nome.toLowerCase();

      resultado = resultado.where(
        (aluno) => aluno.nome.toLowerCase().contains(nomeBusca),
      );
    }

    if (disciplina != null && disciplina.trim().isNotEmpty) {
      final disciplinaBusca = disciplina.toLowerCase();

      resultado = resultado.where(
        (aluno) =>
            aluno.disciplina.toLowerCase().contains(disciplinaBusca),
      );
    }

    return respostaJson({
      'total': resultado.length,
      'alunos': resultado.map((aluno) => aluno.toJson()).toList(),
    });
  });

  router.get('/alunos/<id>', (Request request, String id) {
    final idAluno = int.tryParse(id);

    if (idAluno == null) {
      return respostaJson(
        {
          'erro': 'O ID do aluno deve ser um número inteiro',
        },
        statusCode: HttpStatus.badRequest,
      );
    }

    final aluno = alunos.cast<Aluno?>().firstWhere(
          (aluno) => aluno?.id == idAluno,
          orElse: () => null,
        );

    if (aluno == null) {
      return alunoNaoEncontrado();
    }

    return respostaJson(aluno.toJson());
  });

  return router;
}

Future<void> main() async {
  final router = criarRotas();

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(router.call);

  final server = await shelf_io.serve(
    handler,
    InternetAddress.anyIPv4,
    8080,
  );

  print('Servidor iniciado em http://${server.address.host}:${server.port}');
  print('Acesse http://localhost:8080/');
}