import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_task/app/config/theme/app_theme.dart';

import '../../../../constants/widget/add_province_slot.dart';
import '../../../../constants/widget/app_bar.dart';
import '../../../../constants/widget/image_slider.dart';
import '../../../../constants/widget/province_dropdown.dart';
import '../../../../constants/widget/rounded_button.dart';
import '../../../../constants/widget/slot_dropdown.dart';
import '../../controller/d_controller.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DashboardServicesController dashboardServicesController = Get.find();
  int currentSliderIndex = 0;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    //calling controller function for getting dashboard data
    getDashboardData();
    dashboardServicesController.getTimer();
    super.initState();
  }

  getDashboardData() async {
    await dashboardServicesController.getDashboardData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.appPrimaryColor,
        // here the desired height
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBarWidget(),
        ),
        body: Obx(
          () => dashboardServicesController.isLoading.value
              ? const CircularProgressIndicator()
              : NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverAppBar(
                      collapsedHeight: 340,
                      expandedHeight: 340,
                      flexibleSpace: //image slider
                          ImageSliderLinearIndicator(
                        heightForSlider: 340,
                        dashboardSliderContent: dashboardServicesController.dashboardDataModel.dashboardSliderContent!,
                      ),
                    )
                  ],
                  body: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15.0),
                          topLeft: Radius.circular(15.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          //banner slider
                          BannerSlider(context),
                          //Grocery Button
                          const SizedBox(height: 10),
                          GradientButton(roundedCorner: 8.00, text: 'Grocery', onPressed: () {}),
                          //province dropdown
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: ProvinceDropDownButton(
                                  items: dashboardServicesController.dashboardDataModel.province,
                                  value: dashboardServicesController.selectedProvince.value,
                                  onChanges: (val) {
                                    dashboardServicesController.selectedProvince.value = val;
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: SlotDropDownButton(
                                  items: dashboardServicesController.dashboardDataModel.slot,
                                  value: dashboardServicesController.selectedSlot.value,
                                  onChanges: (val) {
                                    dashboardServicesController.selectedSlot.value = val;
                                  },
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          //add province and slot
                          const AddProvinceSlot(),
                          const SizedBox(height: 10),
                          const Center(
                            child: Text(
                              'Total Price',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Center(
                            child: Text(
                              '160*5 = \$800',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(height: 10),
                          //slot confirm Button
                          GradientButton(roundedCorner: 20.00, text: 'Confirm Slot', onPressed: () {}),
                          //baseline
                          const SizedBox(height: 15),
                          const BaseRow(),
                          const SizedBox(height: 15),
                          //Gridview
                          Wrap(
                            runSpacing: 20.00,
                            spacing: 10.00,
                            children: [
                              for (int i = 0; i < 20; i++)
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle, // This makes the container circular
                                    color: Color(0xffffDEE2), // Set the color of the container
                                  ),
                                  child: Image.asset(
                                    'assets/images/cart.png',
                                  ),
                                ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
        ),
        floatingActionButton: GestureDetector(
          child: const FloatedButton(),
        ),
        bottomNavigationBar: BottomAppBar(
            padding: EdgeInsets.zero,
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18))),
                width: MediaQuery.sizeOf(context).width,
                child: new Row(children: []))),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked);
  }

  Column BannerSlider(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 140,
          child: CarouselSlider(
            items: dashboardServicesController.dashboardDataModel.bannerImages!.map(
              (e) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Image.asset(
                    e.imagePath.toString(),
                    fit: BoxFit.cover,
                  ),
                );
              },
            ).toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(
                  () {
                    currentSliderIndex = index;
                  },
                );
              },
              //autoPlayCurve: Curves.easeOutQuint,
              aspectRatio: 3,
              // height: 300,
            ),
          ),
        ),
        DotsIndicator(
          decorator: DotsDecorator(
            spacing: const EdgeInsets.all(3),
            color: AppTheme.appPrimaryColor.withOpacity(0.5),
            activeColor: AppTheme.appPrimaryColor,
            // activeSize: Size.square(15.0),
            size: const Size(5, 5),
          ),
          dotsCount: dashboardServicesController.dashboardDataModel.bannerImages!.length,
          position: currentSliderIndex,
        ),
      ],
    );
  }
}

class FloatedButton extends StatelessWidget {
  const FloatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(color: AppTheme.appPrimaryColor, width: 2),
      ),
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // border: Border.all(color: Colors.transparent, width: 2),
          gradient: SweepGradient(
            stops: [0.1, 0.3, 0.5, 0.8, 0.9],
            colors: [
              AppTheme.appSecondaryColor,
              AppTheme.appPrimaryColor,
              AppTheme.appSecondaryColor,
              AppTheme.appSecondaryColor,
              AppTheme.appPrimaryColor,
            ],
          ),
        ),
        height: 43,
        child: Center(
            child: Image.asset(
          'assets/images/navigation/scan.png',
          height: 20,
          width: 20,
        )),
      ),
    );
  }
}

class BaseRow extends StatelessWidget {
  const BaseRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset('assets/images/province.png', height: 25, width: 25),
            const SizedBox(width: 5),
            const Text(
              'BC',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.appPrimaryColor.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 2,
              )
            ],
          ),
          child: Image.asset('assets/images/filter.png', height: 20, width: 20),
        )
      ],
    );
  }
}
