import 'package:get/get.dart';

import '../../features/dashboard/bindings/dashboard_binding.dart';
import '../../features/dashboard/view/screen/dashboard.dart';
part 'app_routes.dart';
/// contains all configuration pages
class AppPages {
  /// when the app is opened, this page will be the first to be shown
  static const initial = Routes.dashboard;

  static final routes = [
    //dashboard
    GetPage(
        name: _Paths.dashboard,
        page: () => const Dashboard(),
        binding: DashboardBinding(),
        transition: Transition.leftToRight),

    //splash screen
    // GetPage(
    //   name: _Paths.splashScreen,
    //   page: () => SplashScreen(),
    // ),
  ];
}
