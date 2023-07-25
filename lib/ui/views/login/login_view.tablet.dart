import 'package:absensi_web_admin/ui/common/app_constants.dart';
import 'package:absensi_web_admin/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_view.form.dart';
import 'login_viewmodel.dart';

class LoginViewTablet extends ViewModelWidget<LoginViewModel> with $LoginView {
  const LoginViewTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            width: kdDesktopMaxContentWidth,
            height: kdDesktopMaxContentHeight,
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: mediumSize),
                padding: const EdgeInsets.symmetric(
                  horizontal: mediumSize,
                  vertical: largeSize,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 300,
                      ),
                      child: TextFormField(
                        readOnly: viewModel.loading,
                        //#4: Set email emailController and focus node
                        controller: emailController,
                        decoration: const InputDecoration(hintText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                        focusNode: emailFocusNode,
                      ),
                    ),
                    Visibility(
                      visible: viewModel.hasEmailValidationMessage &&
                          !viewModel.loading,
                      child: Text(
                        viewModel.emailValidationMessage ?? '',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    verticalSpaceMedium,
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 300,
                      ),
                      child: TextFormField(
                        readOnly: viewModel.loading,
                        //#4: Set email emailController and focus node
                        controller: passwordController,
                        decoration: const InputDecoration(hintText: 'Password'),
                        keyboardType: TextInputType.visiblePassword,
                        focusNode: passwordFocusNode, obscureText: true,
                      ),
                    ),
                    Visibility(
                      visible: viewModel.hasPasswordValidationMessage &&
                          !viewModel.loading,
                      child: Text(
                        viewModel.emailValidationMessage ?? '',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    verticalSpaceMedium,
                    MaterialButton(
                      padding: const EdgeInsets.symmetric(
                        horizontal: mediumSize,
                        vertical: smallSize,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.black,
                      onPressed: () => viewModel.saveData(context),
                      child: viewModel.loading
                          ? const SizedBox(
                              width: 8,
                              height: 8,
                              child: CircularProgressIndicator(
                                strokeWidth: 0.8,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
