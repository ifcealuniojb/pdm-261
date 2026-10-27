import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:namer_app/main.dart';

void main() {
  testWidgets('favorito aparece na segunda tela', (tester) async {
    await tester.pumpWidget(const NamerApp());

    await tester.tap(find.text('Like'));
    await tester.pump();
    expect(find.byIcon(Icons.favorite), findsWidgets);

    await tester.tap(find.text('Favorites'));
    await tester.pumpAndSettle();
    expect(find.text('You have 1 favorites:'), findsOneWidget);
    expect(find.byType(ListTile), findsOneWidget);
  });
}
