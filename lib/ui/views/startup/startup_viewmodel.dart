import 'package:absensi_web_admin/app/app.locator.dart';
import 'package:absensi_web_admin/app/app.router.dart';
import 'package:absensi_web_admin/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final _authenticationService = locator<AuthenticationService>();

  Future runStartupLogic() async {
    print('Running startup logic');
    await Future.delayed(const Duration(seconds: 2));
    print(_authenticationService.userLoggedIn());
    if (_authenticationService.userLoggedIn()) {
      _routerService.replaceWith(const HomeViewRoute());
    } else {
      _routerService.replaceWith(const LoginViewRoute());
    }
  }
}
