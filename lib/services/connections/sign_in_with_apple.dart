import 'package:social_connections/services/authentication_with_social_connections.dart';

class SignInWithApple extends AuthenticationWithSocialConnections {
  @override
  SocialConnection get connection => SocialConnection.apple;
}
