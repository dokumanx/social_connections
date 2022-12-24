import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:social_connections/services/authentication_service.dart';

enum SocialConnection {
  apple('apple'),
  google('google-oauth2');

  final String getName;

  const SocialConnection(this.getName);
}

class AuthenticationWithSocialConnections
    extends AuthenticationService<Credentials> {
  SocialConnection get connection {
    throw UnimplementedError('connection getter must be implemented');
  }

  @override
  Future<Credentials> signIn() async {
    try {
      Credentials response =
          await auth0.webAuthentication(scheme: 'demo').login(
        parameters: {'connection': connection.getName},
      );

      if (kDebugMode) {
        print(response.accessToken);
      }
      return response;
    } catch (e) {
      if (!kReleaseMode) {
        debugPrint(e.toString());
      }
      throw Exception();
    }
  }

  @override
  Future<void> signOut() async {
    await auth0.webAuthentication(scheme: 'demo').logout();
  }
}
