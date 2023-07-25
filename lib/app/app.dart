import 'package:absensi_web_admin/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:absensi_web_admin/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:absensi_web_admin/ui/views/home/home_view.dart';
import 'package:absensi_web_admin/ui/views/startup/startup_view.dart';
import 'package:absensi_web_admin/ui/views/unknown/unknown_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:absensi_web_admin/ui/views/login/login_view.dart';
import 'package:absensi_web_admin/services/authentication_service.dart';
import 'package:absensi_web_admin/services/toast_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(page: StartupView, initial: true),
    CustomRoute(page: HomeView),
    MaterialRoute(page: LoginView),
// @stacked-route

    CustomRoute(page: UnknownView, path: '/404'),

    /// When none of the above routes match, redirect to UnknownView
    RedirectRoute(path: '*', redirectTo: '/404'),
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: RouterService),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: ToastService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
