import 'package:flutter/material.dart';
import 'package:test_learning/view-model/login_view_model.dart';
import 'package:test_learning/view/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const _routeName = "/login";
  static get routeName => _routeName;

  @override
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Center(
          child: Text('Login'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              InputFields(),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_key.currentState?.validate() == true) {
                    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                  }
                },
                child: const Text('SignIn'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
