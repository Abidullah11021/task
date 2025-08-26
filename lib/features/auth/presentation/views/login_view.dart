// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:task/common/extensions/num.dart';
import 'package:task/common/widgets/app_filled_button.dart';
import 'package:task/common/widgets/app_text.dart';
import 'package:task/common/widgets/email_input_field.dart';
import 'package:task/common/widgets/password_input_field.dart';
import 'package:task/features/auth/domain/usecases/google_login.dart';
import 'package:task/features/auth/domain/usecases/login.dart';
import 'package:task/gen/assets.gen.dart';
import 'package:task/util/di/di.dart';
import 'package:task/util/exceptions/message_exception.dart';
import 'package:task/util/loading/loading.dart';
import 'package:task/util/resource/r.dart';
import 'package:task/util/router/paths.dart';
import 'package:task/util/toast/toast.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // Controllers
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> loginUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      /// unfocus the keyboard
      FocusManager.instance.primaryFocus?.unfocus();
      loading(context);
      final loginUsecase = sl<LoginUsecase>();
      final input = LoginUsecaseInput(email: email, password: password);
      await loginUsecase(input);
      if (!mounted) return;
      GoRouter.of(context).pushReplacement(RoutePaths.home);
    } on MessageException catch (e) {
      showToast(msg: e.message);
    } finally {
      dismissLoading();
    }
  }

  Future<void> loginGoogleUser({
    required BuildContext context,
  }) async {
    try {
      /// unfocus the keyboard
      FocusManager.instance.primaryFocus?.unfocus();
      loading(context);
      final loginUsecase = sl<GoogleLoginUsecase>();
      await loginUsecase(GoogleLoginUsecaseInput());
      if (!mounted) return;
      GoRouter.of(context).pushReplacement(RoutePaths.home);
    } on MessageException catch (e) {
      showToast(msg: e.message);
    } finally {
      dismissLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  100.hb,
                  Image.asset(
                    Assets.pngs.logo.path,
                    width: 70.r,
                    height: 70.r,
                    fit: BoxFit.cover,
                  ),

                  /// Email
                  70.hb,
                  EmailInputField(
                    controller: _emailController,
                    labelText: "Email",
                    hintText: "abc@example.com",
                  ),
                  10.hb,
                  PasswordInputField(
                    controller: _passwordController,
                    labelText: "Password",
                    hintText: "********",
                  ),

                  30.hb,

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 45.h,
                          decoration: BoxDecoration(
                              color: R.colors.whiteFFFFFF,
                              border: Border.all(
                                  color: R.colors.grey8F959E
                                      .withValues(alpha: 0.7)),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.apple_outlined,
                                color:
                                    R.colors.grey8F959E.withValues(alpha: 0.7),
                                size: 20.sp,
                              ),
                              10.wb,
                              AppText(
                                text: "Apple",
                                color:
                                    R.colors.grey8F959E.withValues(alpha: 0.7),
                              )
                            ],
                          ),
                        ),
                      ),
                      10.wb,
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            loginGoogleUser(context: context);
                          },
                          child: Container(
                            height: 45.h,
                            decoration: BoxDecoration(
                                color: R.colors.whiteFFFFFF,
                                border: Border.all(
                                    color: R.colors.grey8F959E
                                        .withValues(alpha: 0.7)),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 23.r,
                                  height: 23.r,
                                  child: Image.asset(
                                    Assets.pngs.googleLogo.path,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                10.wb,
                                AppText(
                                  text: "Google",
                                  color: R.colors.grey8F959E
                                      .withValues(alpha: 0.7),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  10.hb,

                  /// no accoutn register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppText(text: "Don't have an account? "),
                      InkWell(
                        onTap: () {
                          GoRouter.of(context).push(RoutePaths.signup);
                        },
                        child: AppText(
                          text: "Register",
                          color: R.colors.blue0000FF,
                        ),
                      ),
                    ],
                  ),
                  100.hb,
                  AppFilledButton(
                      text: "Login",
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          loginUser(
                              context: context,
                              email: _emailController.text,
                              password: _passwordController.text);
                        }
                      }),
                  50.hb,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
