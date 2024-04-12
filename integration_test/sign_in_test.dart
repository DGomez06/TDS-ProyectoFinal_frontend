import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:lease_managment/main.dart' as app;

void main() {
  group("Login Test Cases", () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets("Login con credenciales correctas", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Encuentra los widgets
      final Finder usernameField = find.widgetWithText(TextFormField, 'Nombre de usuario');
      final Finder passwordField = find.byType(TextFormField).last;
      final Finder loginBtn = find.text("Iniciar Sesion").last;

      await tester.enterText(usernameField, 'darlin');
      await tester.enterText(passwordField, 'contrasena');
      //Dar tap en iniciar Sesion
      await tester.tap(loginBtn);
    });

    testWidgets("Login con credenciales incorrectas", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Encuentra los widgets
      final Finder usernameField = find.widgetWithText(TextFormField, 'Nombre de usuario');
      final Finder passwordField = find.byType(TextFormField).last;
      final Finder loginBtn = find.text("Iniciar Sesion").last;

      await tester.enterText(usernameField, 'usuarioIncorrecto');
      await tester.enterText(passwordField, 'contrasenaIncorrecta');
      await tester.pumpAndSettle();
      //Dar tap en iniciar Sesion
      await tester.tap(loginBtn);
    });

    testWidgets("Login dejando campo usuario vacio", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Encuentra los widgets
      final Finder passwordField = find.byType(TextFormField).last;
      final Finder loginBtn = find.text("Iniciar Sesion").last;

      await tester.enterText(passwordField, 'contrasena');
      await tester.pumpAndSettle();
      //Dar tap en iniciar Sesion
      await tester.tap(loginBtn);
    });

    testWidgets("Login dejando campo contrasena vacio", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Encuentra los widgets
      final Finder usernameField = find.widgetWithText(TextFormField, 'Nombre de usuario');
      final Finder loginBtn = find.text("Iniciar Sesion").last;

      await tester.enterText(usernameField, 'usario');
      // Dar tap en inicio
      await tester.tap(loginBtn);
    });
  });
}
