import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/app_locators.dart';
import '../../../../cores/component/image_widget.dart';
import '../../../../cores/helper/snack_bar_service.dart';
import '../bloc/login_with_social/login_with_social_bloc.dart';
import '../widgets/login_form_widget.dart';

class LoginView extends StatefulWidget {
  static const String routeName = '/login';

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _loginWithSocialBloc = getIt<LoginWithSocialBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginWithSocialBloc, LoginWithSocialState>(
      bloc: _loginWithSocialBloc,
      listener: listener,
      child: Scaffold(
        body: Stack(alignment: Alignment.topCenter, children: [
          const ImageWidget(
            imageTypes: ImageTypes.asset,
            imageUrl: 'assets/images/login_bg_image.jpg',
            fit: BoxFit.contain,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.3),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: LoginFormWidget(),
          ),
        ]),
      ),
    );
  }
}

extension on _LoginViewState {
  void listener(context, LoginWithSocialState state) {
    if (state is LoginWithSocialSuccess) {
      SnackBarService.showSuccessSnackBar(context, message: state.data.message);

      // Navigator.pushNamed(context, HomeView.routeName);
    } else if (state is LoginWithSocialError) {
      SnackBarService.showErrorSnackBar(context, message: state.message);
    }
  }
}
