import 'package:absensi_web_admin/app/app.bottomsheets.dart';
import 'package:absensi_web_admin/app/app.dialogs.dart';
import 'package:absensi_web_admin/app/app.locator.dart';
import 'package:absensi_web_admin/app/app.router.dart';
import 'package:absensi_web_admin/services/authentication_service.dart';
import 'package:absensi_web_admin/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _authenticationService = locator<AuthenticationService>();
  final _routerService = locator<RouterService>();

  String get counterLabel => 'Counter is: $_counter';
  String get signOutLabel => 'Sign Out';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void runStartupLogic() {
    if (!_authenticationService.userLoggedIn()) {
      _routerService.replaceWith(const LoginViewRoute());
    }
  }

  void signOut() {
    _authenticationService.useSignOut();
    _routerService.replaceWith(const LoginViewRoute());
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
