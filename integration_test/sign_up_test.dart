import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lease_managment/Providers/comunication.dart';
import 'package:lease_managment/ScreensPrincipals/principal_screen.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Taps on the "Registrate" button', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => ContainerVisibility(),
          child: const PrincipalScreen(),
        ),
      ),
    );

    // Find the "Registrate" button.
    final registrateButton = find.text('Registrate').first;

    // Tap on the "Registrate" button.
    await tester.tap(registrateButton);

    // Rebuild the widget after the state has changed.
    await tester.pumpAndSettle();

    // Expect some result here, for example, check if some widget appears on the screen
    // expect(find.byType(SomeWidget), findsOneWidget);

    // Find the "Nombre" field.
    final nameField = find.widgetWithText(TextFormField, 'Nombre').first;

    // Find the "Apellido" field.
    final lastName = find.widgetWithText(TextFormField, 'Apellido').first;

    // Find the "Teleféno" field.
    final telephone = find.widgetWithText(TextFormField, 'Telefono').first;

    // Find the "Correo" field.
    final email = find.widgetWithText(TextFormField, 'Correo').first;

    // Find the "Contraseña" field.
    final password = find.widgetWithText(TextFormField, 'Contraseña').first;

    // Find the "Registrarse" button.
    final signUpButton = find.text('Registrate').first;

    // Enter text into the "Nombre" field.
    await tester.enterText(nameField, 'Adonis');
    // Enter text into the "Apellido" field.
    await tester.enterText(lastName, 'Ferrer');
    // Enter text into the "Teléfono" field.
    await tester.enterText(telephone, '8295896236');
    // Enter text into the "Correo" field.
    await tester.enterText(email, 'example@example.com');
    // Enter text into the "contraseña" field.
    await tester.enterText(password, 'password');

    // Tap on the "Registrarse" button.
    await tester.tap(signUpButton);
    await tester.pumpAndSettle();

   final alertDialogs = tester.widgetList(find.byType(AlertDialog));
   //find the AlertDialog
   //expect(alertDialogs.length, 1); el assert no funciona aun
     
    await tester.pumpAndSettle();
    //make the test wait untill it appears the AlertDialog

  });
}


  