Avaliação 05 - Cliente HTTP

Descrição

Nesta atividade foi utilizado o servidor Web desenvolvido na Avaliação
04, modificando a estrutura dos alunos para:

Aluno(id, nome, disciplina, media, faltas)

Também foi desenvolvido um cliente HTTP responsável por acessar todos os
alunos registrados no servidor e verificar a situação de cada aluno de
acordo com sua média e quantidade de faltas.

Regras

-   Se a média for menor que 6.0, o aluno será considerado “Reprovado”.
-   Caso contrário, o aluno será considerado “Aprovado”.
-   Se o número de faltas for maior que 20, o aluno será considerado
    “Reprovado por Faltas”.
-   Para cada aluno é apresentada uma única mensagem.

Formato da saída

ID NOME DISCIPLINA MEDIA FALTAS MENSAGEM

Execução

Servidor

    dart run bin/server.dart

O servidor é iniciado na porta 8080 e disponibiliza os alunos através da
rota:

    GET /alunos

Cliente HTTP

Com o servidor em execução, em outro terminal:

    dart run bin/cliente.dart

O cliente acessa o servidor, obtém a lista de alunos e apresenta a
situação de cada um.

Evidências

As evidências de execução da atividade estão disponíveis na pasta
evidencias.
