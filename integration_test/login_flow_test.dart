import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:test_learning/home_sreen.dart';
import 'package:test_learning/login_screen.dart';

void main() {
  group(
    'Login Flow Testing',
    () {
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();
      testWidgets(
          "Should show Required filed error when user taps on login button without entering  email or password",
          (WidgetTester tester) async {
        //Arrange
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
        await tester.pumpAndSettle(const Duration(seconds: 2));

        Finder errorText = find.text("Required field");
        //Assert
        expect(errorText, findsNWidgets(2));
      });
      //test for valid flows so:
      testWidgets(
          "Should show home screen when user taps on login button after entering valid email & password",
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

        Finder emailFinder = find.byKey(
          const Key('email'),
        );
        Finder passwordFinder = find.byKey(
          const Key('password'),
        );
        await tester.enterText(emailFinder, email);
        await tester.enterText(passwordFinder, password);

        Finder loginButtonFinder = find.byType(ElevatedButton);
        await tester.tap(loginButtonFinder);
        await tester.pumpAndSettle(const Duration(seconds: 2));

        Finder welcomeText = find.byType(Text);
        //Assert
        expect(welcomeText, findsOneWidget);
      });
    },
  );
}
