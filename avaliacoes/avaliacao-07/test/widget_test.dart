import 'package:animated_responsive_layout/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Mostra mensagens e navegação em português no celular', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MainApp());
    expect(find.text('Buscar mensagens'), findsOneWidget);
    expect(find.text('Receita de família'), findsOneWidget);
    expect(find.text('Marina Costa'), findsOneWidget);
    expect(find.text('Entrada'), findsWidgets);
  });
}
