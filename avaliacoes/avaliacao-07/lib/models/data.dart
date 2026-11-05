// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'models.dart';

final User user_0 = User(
  name: const Name(first: 'Eu', last: ''),
  avatarUrl: 'assets/avatar_1.png',
  lastActive: DateTime.now(),
);
final User user_1 = User(
  name: const Name(first: 'Antônio', last: 'Silva'),
  avatarUrl: 'assets/avatar_2.png',
  lastActive: DateTime.now().subtract(const Duration(minutes: 10)),
);
final User user_2 = User(
  name: const Name(first: 'Marina', last: 'Costa'),
  avatarUrl: 'assets/avatar_3.png',
  lastActive: DateTime.now().subtract(const Duration(minutes: 20)),
);
final User user_3 = User(
  name: const Name(first: 'Lívia', last: 'Almeida'),
  avatarUrl: 'assets/avatar_4.png',
  lastActive: DateTime.now().subtract(const Duration(hours: 2)),
);
final User user_4 = User(
  name: const Name(first: 'Caio', last: 'Ferreira'),
  avatarUrl: 'assets/avatar_5.png',
  lastActive: DateTime.now().subtract(const Duration(hours: 6)),
);

const String conviteClube =
    'Pessoal, que tal conhecer o restaurante novo perto da praça? '
    'Eles fazem pratos regionais e têm um baião de dois que parece incrível. '
    'Podemos ir no sábado depois da aula. Quem topa?\n\nMarina';

final List<Email> emails = [
  Email(
    sender: user_1,
    recipients: [],
    subject: 'Receita de família',
    content:
        'Oi! Encontrei a receita da tapioca que você pediu. '
        'O segredo é deixar a goma bem soltinha antes de levar à frigideira. '
        'Depois te mando as medidas certinhas.',
  ),
  Email(
    sender: user_2,
    recipients: [],
    subject: 'Clube da comida',
    content: conviteClube,
  ),
  Email(
    sender: user_3,
    recipients: [],
    subject: 'Um programa para assistir',
    content:
        'Você vai gostar deste programa de culinária! '
        'A apresentadora visita cozinhas pelo Nordeste e mostra as histórias '
        'por trás de cada receita. O episódio sobre o Ceará está lindo.',
    attachments: [const Attachment(url: 'assets/thumbnail_1.png')],
  ),
  Email(
    sender: user_4,
    recipients: [],
    subject: 'Mutirão no fim de semana',
    content:
        'No domingo vai ter um mutirão para cuidar da praça do bairro. '
        'Vamos juntos? Depois a turma pode tomar um café por lá.',
  ),
];

final List<Email> replies = [
  Email(
    sender: user_2,
    recipients: [user_3, user_0],
    subject: 'Clube da comida',
    content: conviteClube,
    replies: 2,
  ),
  Email(
    sender: user_0,
    recipients: [user_3, user_2],
    subject: 'Clube da comida',
    content:
        'Eu topo! Vi umas fotos do cardápio e fiquei com vontade de provar '
        'o baião de dois. Que tal a gente se encontrar na praça às 19h? '
        'Posso chamar o Caio também.\n\nAté sábado!',
  ),
];
