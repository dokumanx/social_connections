import 'package:auth0_flutter/auth0_flutter.dart';

abstract class AuthenticationService<T> {
  Auth0 auth0 = Auth0(
    'YOUR_AUTH0_DOMAIN',
    'YOUR_AUTH0_CLIENT_ID',
  );

  Future<T> signIn();

  Future<void> signOut();
}
