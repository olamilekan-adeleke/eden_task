import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/app_locators.dart';
import '../../../../cores/component/custom_text_widget.dart';
import '../../../../cores/component/image_widget.dart';
import '../../../../cores/component/loading_indicator.dart';
import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_size.dart';
import '../../../../cores/helper/space_helper.dart';
import '../bloc/login_with_social/login_with_social_bloc.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  static final _loginWithSocialBloc = getIt<LoginWithSocialBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: symmetricPadding(horizontal: 15, vertical: 20),
      height: sh(40),
      width: sw(100),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: [
        const TextWidget.semibold("Welcome to Eden Task", size: kfsExtraLarge),
        verticalSpace(3),
        Padding(
          padding: symmetricPadding(horizontal: 30),
          child: const TextWidget.light(
            "Proceed to login to your account using your Google or GitHub Account",
            size: kfsRegular,
            withOpacity: 0.8,
            textAlign: TextAlign.center,
            height: 1.3,
          ),
        ),
        verticalSpace(40),
        Expanded(
          child: BlocBuilder<LoginWithSocialBloc, LoginWithSocialState>(
            bloc: _loginWithSocialBloc,
            builder: (context, state) {
              bool isLoading = state is LoginWithSocialLoading;

              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: isLoading
                    ? const Center(child: LoadingIndicatorWidget())
                    : buildButtonWidget(context),
              );
            },
          ),
        ),
        verticalSpace(40),
        const TextWidget.light(
          "By continuing you agree to our Terms of Service and Privacy Policy",
          textAlign: TextAlign.center,
          height: 1.3,
          size: kfsVeryTiny,
        ),
        verticalSpace()
      ]),
    );
  }
}

extension on LoginFormWidget {
  Widget buildButtonWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSocialButton("google.png", "Login with Google", onTap: () {
          final loginWithSocialBloc = getIt<LoginWithSocialBloc>();
          loginWithSocialBloc.add(LoginWithGoogle());
        }),
        buildOrDividerOption(),
        buildSocialButton("gitHub.png", "Login with GitHub", onTap: () {
          final loginWithSocialBloc = getIt<LoginWithSocialBloc>();
          loginWithSocialBloc.add(
            LoginWithGithub(LoginWithGithubParam(context: context)),
          );
        }),
      ],
    );
  }

  Widget buildOrDividerOption() {
    return Padding(
      padding: symmetricPadding(vertical: 10),
      child: Row(children: const [
        Expanded(child: Divider(color: AppColor.dividerColor)),
        TextWidget("    Or    ", size: kfsRegular),
        Expanded(child: Divider(color: AppColor.dividerColor)),
      ]),
    );
  }

  Widget buildSocialButton(String iconPath, String title,
      {VoidCallback? onTap}) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: symmetricPadding(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.dividerColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageWidget(
              imageUrl: "assets/icons/$iconPath",
              imageTypes: ImageTypes.asset,
              width: w(20),
              height: h(20),
            ),
            horizontalSpace(10),
            TextWidget(title, size: kfsMedium),
          ],
        ),
      ),
    );
  }
}
