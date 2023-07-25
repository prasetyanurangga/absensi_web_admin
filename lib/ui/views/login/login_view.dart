import 'package:absensi_web_admin/ui/common/form_validators.dart';
import 'package:absensi_web_admin/ui/views/login/login_view.form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_view.desktop.dart';
import 'login_view.mobile.dart';
import 'login_view.tablet.dart';
import 'login_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(
      name: 'email',
      initialValue: "Lorem",
      validator: FormValidators.emailValidator,
    ),
    FormTextField(
      name: 'password',
      validator: FormValidators.passwordValidator,
    ),
  ],
  autoTextFieldValidation: true,
)
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({super.key});

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const LoginViewMobile(),
      tablet: (_) => const LoginViewTablet(),
      desktop: (_) => const LoginViewDesktop(),
    );
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    SchedulerBinding.instance
        .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
