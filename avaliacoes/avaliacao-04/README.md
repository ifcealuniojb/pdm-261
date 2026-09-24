# Avaliação 04

Atividade desenvolvida em Dart com criação de um servidor web utilizando `shelf` e `shelf_router`.

O servidor possui uma lista de alunos mockados e disponibiliza rotas para consulta via API REST.

## Testes realizados

Consulta de todos os alunos:
curl.exe http://localhost:8080/alunos

Consulta do aluno de ID 2:
curl.exe http://localhost:8080/alunos/2

Consulta de aluno inexistente:
curl.exe http://localhost:8080/alunos/99

Evidências

As evidências dos testes estão armazenadas na pasta evidencias.
