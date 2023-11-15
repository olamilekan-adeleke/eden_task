import 'package:firebase_auth/firebase_auth.dart';
import 'package:github_sign_in_plus/github_sign_in_plus.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../cores/base_request_body/base_request_body.dart';
import '../../../../cores/try_catch_helper/logger.dart';
import '../../presentation/bloc/login_with_social/login_with_social_bloc.dart';
import '../models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> loginWithGoogle();

  Future<AuthModel> loginWithGithub(RequestParam param);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final GoogleSignIn googleSignIn;

  AuthRemoteDataSourceImpl({required this.googleSignIn});

  @override
  Future<AuthModel> loginWithGithub(RequestParam param) async {
    final loginWithGithubParam = param as LoginWithGithubParam;
    final GitHubSignIn gitHubSignIn = GitHubSignIn(
      clientId: "730bff61ff74a84d2d22",
      clientSecret: "01ca0ae9697d1be72be8d12cd4ec7db7b29e6bee",
      redirectUrl: "https://github.com/olamilekan-adeleke",
    );

    final context = loginWithGithubParam.context;
    final GitHubSignInResult result = await gitHubSignIn.signIn(context);

    if (result.status != GitHubSignInResultStatus.ok) {
      final githubAuthCredential = GithubAuthProvider.credential(result.token!);
      final UserCredential userData = await FirebaseAuth.instance
          .signInWithCredential(githubAuthCredential);

      LoggerHelper.log(userData.toString());
    } else {
      throw Exception("Github login failed");
    }

    throw UnimplementedError();
  }

  @override
  Future<AuthModel> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final UserCredential userData =
        await FirebaseAuth.instance.signInWithCredential(credential);

    LoggerHelper.log(userData.toString());
    throw UnimplementedError();
  }
}


///  UserCredential(additionalUserInfo: AdditionalUserInfo(isNewUser: true, profile: 
/// {at_hash: ffdYDzZVygH-76hoKMIqOQ, exp: 1700068736, azp: 552810675673-ii7t94q7vauhudglb8no6sqju0jrhvmn.apps.googleusercontent.com,
/// nonce: p7EQ3vs0Ed9luvoHBAi7s-ha1dEhEiOwc1QG3zkqJE0, picture: https://lh3.googleusercontent.com/a/ACg8ocJ9wGidl0HuJH6tw3cg42Zvd_OoNUbfSaiPg3VDED1aGpI=s96-c, 
/// locale: en, iss: https://accounts.google.com, email_verified: true, sub: 107593552777288625878, 
/// aud: 552810675673-ii7t94q7vauhudglb8no6sqju0jrhvmn.apps.googleusercontent.com, 
/// family_name: Adeleke, iat: 1700065136, email: olamilekanly66@gmail.com, name: Olamilekan Adeleke, 
/// given_name: Olamilekan}, providerId: google.com, username: null, authorizationCode: null), 
/// credential: AuthCredential(providerId: google.com, signInMethod: google.com, token: 105553156514480, 
/// accessToken: ya29.a0AfB_byBH4MzWargGw2cWONGsjZBtbRpzdwg_2we7fjjMDA8bbY2OVrzqhtPiMallGipxnT7PTn409nqrR41CaT96QlUHL-fE6zwA_FZlYZ0gFUdIQ9I0gMcwkbPql4PIyeJlmlDylGKnn7SzX_kWkTLQ3l3BghaubnWNaCgYKAWISARISFQHGX2MizM6zAjcoIXgGfNwYh3ojRw0171), 
/// user: User(displayName: Olamilekan Adeleke, email: olamilekanly66@gmail.com, isEmailVerified: true, isAnonymous: false, 
/// metadata: UserMetadata(creationTime: 2023-11-15 16:18:57.422Z, lastSignInTime: 2023-11-15 16:18:57.423Z), 
/// phoneNumber: null, photoURL: https://lh3.googleusercontent.com/a/ACg8ocJ9wGidl0HuJH6tw3cg42Zvd_OoNUbfSaiPg3VDED1aGpI=s96-c, 
/// providerData, [UserInfo(displayName: Olamilekan Adeleke, email: olamilekanly66@gmail.com, phoneNumber: null, photoURL: null, 
/// providerId: google.com, uid: 107593552777288625878)], refreshToken: AMf-vBxKu3igehkVBRKVr6HbmY7UX00qLYT03dsftjDA3GhDu7XKnPOt3oemvdX5ddo_-CTWlC2wdrnGgkb6mSVGUk5jYfg63yprXYp0hK0u77bwlq5N74MLOHjMZpDGF8a45o56g6hfKg_y8gpXsJQcwRfG6_ZTOqTWM4TRgGHX-sGVpNUME6BpBjNmF7eC09LROX5u0YA8AHPHkUUnhFxfOh5Yse9cxZhw1xqZTVF7t_kyv1skdJklGUrwalKoiGLUBHVGWLCGOndtwxdOnf6l2H65APqzkqmmdlUw2AyuCbaLEua2-lp4tIt7AKNsG_8IIzz586xnvEue5nQNqdzfji0A155xm-RvpYISgfDZudexOH1ZVhdC6LmO_3NQRjXU53WDA5xAvXoSbM_HxxxcWEyCTN81P6xV0v3PElQXEthR8sina1rCvRzf7Z_3Yb6r0ndHUsnq, 
/// tenantId: null, uid: hc2cB7FLlygb3mS8aPzbASRGLdG2))