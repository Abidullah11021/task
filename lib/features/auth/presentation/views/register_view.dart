// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:task/common/extensions/num.dart';
import 'package:task/common/widgets/app_filled_button.dart';
import 'package:task/common/widgets/app_text.dart';
import 'package:task/common/widgets/email_input_field.dart';
import 'package:task/common/widgets/password_input_field.dart';
import 'package:task/features/auth/domain/usecases/register.dart';
import 'package:task/gen/assets.gen.dart';
import 'package:task/util/di/di.dart';
import 'package:task/util/exceptions/message_exception.dart';
import 'package:task/util/loading/loading.dart';
import 'package:task/util/resource/r.dart';
import 'package:task/util/router/paths.dart';
import 'package:task/util/toast/toast.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  // Controllers
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _agreedToTerms = false; // ✅ Track checkbox state

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> registerUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      FocusManager.instance.primaryFocus?.unfocus();
      loading(context);
      final registerUsecase = sl<RegisterUsecase>();
      final input = RegisterUsecaseInput(email: email, password: password);
      await registerUsecase(input);
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
                  20.hb,
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
                  10.hb,
                  PasswordInputField(
                    controller: _confirmPasswordController,
                    labelText: "Confirm Password",
                    hintText: "********",
                    validator: (p0) {
                      if (p0 != _passwordController.text) {
                        return "Password doesn't match";
                      }
                      return null;
                    },
                  ),

                  30.hb,
Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppText(text: "Already have an account? "),
                      InkWell(
                        onTap: () {
                          GoRouter.of(context).push(RoutePaths.login);
                        },
                        child: AppText(
                          text: "Login",
                          color: R.colors.blue0000FF,
                        ),
                      ),
                    ],
                  ),
                  150.hb,
                  /// Terms & Conditions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     
                      AppText(
                        text:
                            "Agree to Terms & Conditions",
                      ),
                       Checkbox(
                        value: _agreedToTerms,
                        onChanged: (value) {
                          setState(() {
                            _agreedToTerms = value ?? false;
                          });
                        },
                      ),
                    ],
                  ),

                  20.hb,

                  /// Submit Button
                  AppFilledButton(
                    text: "Register",
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        if (!_agreedToTerms) {
                          showToast(msg: "You must agree to Terms & Conditions");
                          return;
                        }
                        registerUser(
                          context: context,
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                      }
                    },
                  ),

                  30.hb,

                  /// Already have account
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
