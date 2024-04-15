import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lease_managment/ScreensPrincipals/ScreensHome/find.dart';
void main() {
  testWidgets('Funcion buscar sin filtro', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: FindScreen()));

    expect(find.text('Buscar'), findsOneWidget);

    //add a wait time 
    await tester.pumpAndSettle();

    //Encontrar the buscar textfield
    final buscarField = find.widgetWithText(TextField, 'Buscar');

    // Entrar texto en el campo de buscar
    await tester.enterText(buscarField, 'Casa');
    await tester.testTextInput.receiveAction(TextInputAction.done);

    //add a 5 second wait time
    await tester.pumpAndSettle(const Duration(seconds: 5));
  });

  testWidgets('Funcion buscar con filtro precio', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: FindScreen()));

    final popupMenuButton = find.byWidgetPredicate(
      (Widget widget) =>
          widget is PopupMenuButton &&
          widget.icon is Icon &&
          (widget.icon as Icon).icon == Icons.filter_alt_outlined,
      description: 'PopupMenuButton with Icon filter_alt_outlined',
    );

    final buscarField = find.widgetWithText(TextField, 'Buscar');


    await tester.tap(popupMenuButton);
    await tester.pumpAndSettle();

    expect(find.text('Precio'), findsOneWidget);
    await tester.tap(find.text('Precio'));


    // Entrar texto en el campo de buscar
    await tester.enterText(buscarField, '50');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle(const Duration(seconds: 5));
  });

  testWidgets('Funcion buscar con filtro Tpo de propiedad - Edificio', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: FindScreen()));

    final popupMenuButton = find.byWidgetPredicate(
      (Widget widget) =>
          widget is PopupMenuButton &&
          widget.icon is Icon &&
          (widget.icon as Icon).icon == Icons.filter_alt_outlined,
      description: 'PopupMenuButton with Icon filter_alt_outlined',
    );

    await tester.tap(popupMenuButton);
    await tester.pumpAndSettle();

    expect(find.text('Tipo de Propiedad'), findsOneWidget);
    await tester.tap(find.text('Tipo de Propiedad'));
    await tester.pumpAndSettle();

    expect(find.text('Edificio'), findsOneWidget);
    expect(find.text('Casa'), findsOneWidget);
    expect(find.text('Penthouse'), findsOneWidget);
    expect(find.text('Planta'), findsOneWidget);

    await tester.tap(find.text('Edificio'));


    await tester.pumpAndSettle(const Duration(seconds: 5));
  });

  testWidgets('Funcion buscar con filtro Tpo de propiedad - Casa', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: FindScreen()));

    final popupMenuButton = find.byWidgetPredicate(
      (Widget widget) =>
          widget is PopupMenuButton &&
          widget.icon is Icon &&
          (widget.icon as Icon).icon == Icons.filter_alt_outlined,
      description: 'PopupMenuButton with Icon filter_alt_outlined',
    );

    await tester.tap(popupMenuButton);
    await tester.pumpAndSettle();

    expect(find.text('Tipo de Propiedad'), findsOneWidget);
    await tester.tap(find.text('Tipo de Propiedad'));
    await tester.pumpAndSettle();

    expect(find.text('Edificio'), findsOneWidget);
    expect(find.text('Casa'), findsOneWidget);
    expect(find.text('Penthouse'), findsOneWidget);
    expect(find.text('Planta'), findsOneWidget);

    await tester.tap(find.text('Casa'));
    await tester.pumpAndSettle(const Duration(seconds: 5));
  });

  testWidgets('Funcion buscar con filtro Tpo de propiedad - Penthouse', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: FindScreen()));

    final popupMenuButton = find.byWidgetPredicate(
      (Widget widget) =>
          widget is PopupMenuButton &&
          widget.icon is Icon &&
          (widget.icon as Icon).icon == Icons.filter_alt_outlined,
      description: 'PopupMenuButton with Icon filter_alt_outlined',
    );

    await tester.tap(popupMenuButton);
    await tester.pumpAndSettle();

    expect(find.text('Tipo de Propiedad'), findsOneWidget);
    await tester.tap(find.text('Tipo de Propiedad'));
    await tester.pumpAndSettle();

    expect(find.text('Edificio'), findsOneWidget);
    expect(find.text('Casa'), findsOneWidget);
    expect(find.text('Penthouse'), findsOneWidget);
    expect(find.text('Planta'), findsOneWidget);

    await tester.tap(find.text('Penthouse'));
    await tester.pumpAndSettle(const Duration(seconds: 5));
  });

  testWidgets('Funcion buscar con filtro Tpo de propiedad - Planta', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: FindScreen()));

    final popupMenuButton = find.byWidgetPredicate(
      (Widget widget) =>
          widget is PopupMenuButton &&
          widget.icon is Icon &&
          (widget.icon as Icon).icon == Icons.filter_alt_outlined,
      description: 'PopupMenuButton with Icon filter_alt_outlined',
    );

    await tester.tap(popupMenuButton);
    await tester.pumpAndSettle();

    expect(find.text('Tipo de Propiedad'), findsOneWidget);
    await tester.tap(find.text('Tipo de Propiedad'));
    await tester.pumpAndSettle();

    expect(find.text('Edificio'), findsOneWidget);
    expect(find.text('Casa'), findsOneWidget);
    expect(find.text('Penthouse'), findsOneWidget);
    expect(find.text('Planta'), findsOneWidget);

    await tester.tap(find.text('Planta'));
    await tester.pumpAndSettle(const Duration(seconds: 5)); 
  });

  testWidgets('Funcion buscar con filtro Tamaño - Grande', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: FindScreen()));

    final popupMenuButton = find.byWidgetPredicate(
      (Widget widget) =>
          widget is PopupMenuButton &&
          widget.icon is Icon &&
          (widget.icon as Icon).icon == Icons.filter_alt_outlined,
      description: 'PopupMenuButton with Icon filter_alt_outlined',
    );

    await tester.tap(popupMenuButton);
    await tester.pumpAndSettle();

    expect(find.text('Tamaño'), findsOneWidget);
    await tester.tap(find.text('Tamaño'));
    await tester.pumpAndSettle();

    expect(find.text('Grande'), findsOneWidget);
    expect(find.text('Mediano'), findsOneWidget);
    expect(find.text('Pequeño'), findsOneWidget);
   
    await tester.tap(find.text('Grande'));
    await tester.pumpAndSettle(const Duration(seconds: 5)); 
  });

  testWidgets('Funcion buscar con filtro Tamaño - Mediano', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: FindScreen()));

    final popupMenuButton = find.byWidgetPredicate(
      (Widget widget) =>
          widget is PopupMenuButton &&
          widget.icon is Icon &&
          (widget.icon as Icon).icon == Icons.filter_alt_outlined,
      description: 'PopupMenuButton with Icon filter_alt_outlined',
    );

    await tester.tap(popupMenuButton);
    await tester.pumpAndSettle();

    expect(find.text('Tamaño'), findsOneWidget);
    await tester.tap(find.text('Tamaño'));
    await tester.pumpAndSettle();

    expect(find.text('Grande'), findsOneWidget);
    expect(find.text('Mediano'), findsOneWidget);
    expect(find.text('Pequeño'), findsOneWidget);

    await tester.tap(find.text('Mediano'));
    await tester.pumpAndSettle(const Duration(seconds: 5)); 
  });

  testWidgets('Funcion buscar con filtro Tamaño - Pequeño', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: FindScreen()));

    final popupMenuButton = find.byWidgetPredicate(
      (Widget widget) =>
          widget is PopupMenuButton &&
          widget.icon is Icon &&
          (widget.icon as Icon).icon == Icons.filter_alt_outlined,
      description: 'PopupMenuButton with Icon filter_alt_outlined',
    );

    await tester.tap(popupMenuButton);
    await tester.pumpAndSettle();

    expect(find.text('Tamaño'), findsOneWidget);
    await tester.tap(find.text('Tamaño'));
    await tester.pumpAndSettle();

    expect(find.text('Grande'), findsOneWidget);
    expect(find.text('Mediano'), findsOneWidget);
    expect(find.text('Pequeño'), findsOneWidget);

    await tester.tap(find.text('Pequeño'));
    await tester.pumpAndSettle(const Duration(seconds: 5)); 
  });
}
