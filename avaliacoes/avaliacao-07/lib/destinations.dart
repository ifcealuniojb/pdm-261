// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:material_ui/material_ui.dart';

class Destination {
  const Destination(this.icon, this.label);
  final IconData icon;
  final String label;
}

const List<Destination> destinations = <Destination>[
  Destination(Icons.inbox_rounded, 'Entrada'),
  Destination(Icons.article_outlined, 'Artigos'),
  Destination(Icons.messenger_outline_rounded, 'Mensagens'),
  Destination(Icons.group_outlined, 'Grupos'),
];
