import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_learning/home_sreen.dart';
import 'package:test_learning/login_screen.dart';

void main() {
  //Arrange
  testWidgets(
    'Login Should have a Title',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );
      //Act
      Finder titleFinder = find.text('Login');

      //Assert
      expect(titleFinder, findsOneWidget);
    },
  );

  testWidgets(
    'Should have one text fild form input for user email',
    (WidgetTester tester) async {
      //Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );
      //Act
      Finder emailFinder = find.byKey(
        const Key('email'),
      );
      //Assert
      expect(emailFinder, findsOneWidget);
    },
  );
  testWidgets(
    'Should have one text fild form input for user password',
    (WidgetTester tester) async {
      //Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );
      //Act
      Finder passwordFinder = find.byKey(
        const Key('password'),
      );
      //Assert
      expect(passwordFinder, findsOneWidget);
    },
  );

  testWidgets(
    'Should have one login button',
    (WidgetTester tester) async {
      //Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );
      //Act
      Finder loginButtonFinder = find.byType(ElevatedButton);
      //Assert
      expect(loginButtonFinder, findsOneWidget);
    },
  );
  testWidgets(
    'Should show required field error messAge when email is empty & password is empty',
    (WidgetTester tester) async {
      //Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );
      //Act
      Finder loginButtonFinder = find.byType(ElevatedButton);
      await tester.tap(loginButtonFinder);
      await tester.pumpAndSettle();
      Finder errorTexts = find.text('Required field');
      //Assert
      expect(errorTexts, findsNWidgets(2));
    },
  );

  testWidgets(
    'Should submit form when email & password are valid',
    (WidgetTester tester) async {
      //Arrange
      var email = "test@gmail.com";
      var password = "Test@123";
      await tester.pumpWidget(
        MaterialApp(
          home: const LoginScreen(),
          routes: {
            HomeScreen.routeName: (context) => const HomeScreen(),
            LoginScreen.routeName: (context) => const LoginScreen(),
          },
        ),
      );
      //Act
      Finder loginButtonFinder = find.byType(ElevatedButton);
      await tester.tap(loginButtonFinder);
      await tester.pumpAndSettle();
      Finder emailFinder = find.byKey(
        const Key('email'),
      );
      Finder passwordFinder = find.byKey(
        const Key('password'),
      );
      await tester.enterText(emailFinder, email);
      await tester.enterText(passwordFinder, password);
      await tester.tap(loginButtonFinder);
      await tester.pumpAndSettle();
      Finder errorTexts = find.text('Required field');
      //Assert
      expect(errorTexts, findsNothing);
    },
  );
}
