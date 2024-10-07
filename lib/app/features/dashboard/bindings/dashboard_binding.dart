import 'package:get/get.dart';

import '../controller/d_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardServicesController());
  }
}
