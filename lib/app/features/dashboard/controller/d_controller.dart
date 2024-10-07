import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../data_model/dashboard_datamodel.dart';

class DashboardServicesController extends GetxController {
  //for data loading indication
  RxBool isLoading = true.obs;

  //data model variable
  DashboardDataModel dashboardDataModel = DashboardDataModel();

  //dropdown variables
  Rx<Province> selectedProvince = Province().obs;
  Rx<Slot> selectedSlot = Slot().obs;

  //times
  RxInt hours = 7.obs;
  RxInt minutes = 59.obs;
  RxInt seconds = 59.obs;
  late Timer timer;

  //timer
  getTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds.value != 0) {
        seconds.value--;
      } else {
        minutes.value--;
        seconds.value = 60;
      }
    });
  }

  //fetch data from json file function
  Future getDashboardData() async {
    // try {
    isLoading.value = true;
    String data = await rootBundle.loadString("assets/json/data.json");
    final response = jsonDecode(data);
    dashboardDataModel = DashboardDataModel.fromJson(response);
    selectedProvince.value = dashboardDataModel.province![0];
    selectedSlot.value = dashboardDataModel.slot![0];
    log(dashboardDataModel.dashboardSliderContent.toString() + 'ppppppppppppppp');
    // } catch (e) {
    //display error popup if data is not loaded properly
    // } finally {
    Future.delayed(const Duration(seconds: 3));
    isLoading.value = false;
    // }
  }
}
