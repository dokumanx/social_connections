import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:social_connections/screens/profile_page.dart';
import 'package:social_connections/services/connections/sign_in_with_apple.dart';
import 'package:social_connections/services/connections/sing_in_with_google.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void navigateToUserProfile(Credentials credentials) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(
          credentials: credentials,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                SignInWithApple signInWithApple = SignInWithApple();

                final credentials = await signInWithApple.signIn();
                navigateToUserProfile(credentials);
              },
              child: const Text('Sign in with Apple'),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  SignInWithGoogle signInWithGoogle = SignInWithGoogle();
                  final credentials = await signInWithGoogle.signIn();
                  navigateToUserProfile(credentials);
                } catch (e) {
                  if (kDebugMode) {
                    print(e);
                  }
                }
              },
              child: const Text('Sign in with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
