import 'package:absensi_web_admin/app/app.locator.dart';
import 'package:absensi_web_admin/app/app.router.dart';
import 'package:absensi_web_admin/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'login_view.form.dart';

class LoginViewModel extends FormViewModel {
  final _dialogService = locator<DialogService>();
  final _authenticationService = locator<AuthenticationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _routerService = locator<RouterService>();


  Future<void> initialize(BuildContext context) async {
    // Your initialization code here
    // You can use the provided BuildContext to interact with the Flutter framework if needed.

    // For example, if you want to show a SnackBar:
    print(context);
    print('context');

    // You can also do other asynchronous tasks here.
  }

  bool loading = false;

  void runStartupLogic() {
    print(_authenticationService.userLoggedIn());
    if (_authenticationService.userLoggedIn()) {
      _routerService.replaceWith(const HomeViewRoute());
    }
  }

  @override
  void setFormStatus() {
    // log.i('Set form Status with data: $formValueMap');

    // Set a validation message for the entire form
    if (hasPasswordValidationMessage) {
      setValidationMessage('Error in the form, please check again');
    }

    if (hasEmailValidationMessage) {
      setValidationMessage('Error in the form, please check again');
    }
  }

  // If the dev doesn't want realtime validation then they can
  // simply validate in the function that they'll use to submit the
  // data to the backend or db.

  Future? saveData(context) async {
    loading = true;
    rebuildUi();

    bool resultSignIn = await _authenticationService.useSignIn(
        emailValue ?? "", passwordValue ?? "");

    loading = false;
    rebuildUi();

    showSnackbar(context, resultSignIn ? 'Login Success' : 'Login Failed');


    _routerService.replaceWith(const HomeViewRoute());

    // showToastMessage('Login Success', isError: false);

    return null;

    // here we can run custom functionality to save to our api
  }

  void showSnackbar(context, String title) {
    final snackBar = SnackBar(
      content:  Text(title),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
