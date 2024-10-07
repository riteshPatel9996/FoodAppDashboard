import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/theme/app_theme.dart';
import '../../features/dashboard/controller/d_controller.dart';
import 'gridview_layout.dart';

class AddProvinceSlot extends StatefulWidget {
  const AddProvinceSlot({super.key});

  @override
  State<AddProvinceSlot> createState() => _AddProvinceSlotState();
}

class _AddProvinceSlotState extends State<AddProvinceSlot> {
  final DashboardServicesController dashboardServicesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Color(0xffffDEE2),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          )),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Coupon Details',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              Text('Price per Slot = 5', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600))
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 60,
            child: GridLayout(
              itemCount: dashboardServicesController.dashboardDataModel.provinceSlotList!.length,
              mainAxisExtent: 40,
              itemBuilder: (_, index) {
                return SlotContainer(dashboardServicesController: dashboardServicesController, index: index);
              },
            ),
          ),
          const SizedBox(height: 10),
          Container(height: 1, color: AppTheme.appPrimaryColor),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Balance:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                'Remaining Time',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )
            ],
          ),
          const SizedBox(height: 10),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '\$1453',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      width: 55.0,
                      height: 55.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppTheme.appSecondaryColor,
                          width: 2.0,
                        ),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '07',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Text('Hours', style: TextStyle(fontSize: 12))
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      padding: const EdgeInsets.all(2),
                      width: 55.0,
                      height: 55.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppTheme.appSecondaryColor,
                          width: 2.0,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dashboardServicesController.minutes.value.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const Text('Min.', style: TextStyle(fontSize: 12))
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      padding: const EdgeInsets.all(2),
                      width: 55.0,
                      height: 55.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppTheme.appSecondaryColor,
                          width: 2.0,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dashboardServicesController.seconds.value.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const Text('Sec.', style: TextStyle(fontSize: 12))
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SlotContainer extends StatelessWidget {
  SlotContainer({super.key, required this.dashboardServicesController, required this.index});

  final DashboardServicesController dashboardServicesController;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.appPrimaryColor, AppTheme.appSecondaryColor],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.circular(20.00), // Apply border radius
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            dashboardServicesController.dashboardDataModel.provinceSlotList![index].name!,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const SizedBox(height: 5),
          Text(
            dashboardServicesController.dashboardDataModel.provinceSlotList![index].slot!,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
          )
        ],
      ),
    );
  }
}

// class HalfBorderPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()
//       ..color = AppTheme.appPrimaryColor.withOpacity(0.4)
//       ..strokeWidth = 5.0
//       ..style = PaintingStyle.stroke;
//
//     final Path path = Path();
//     path.lineTo(0, size.height / 2);
//     path.addArc(
//         Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2), -0.5 * 3.14, 3.14);
//
//     canvas.drawPath(path, paint);
//
//     paint.color = AppTheme.appPrimaryColor;
//     final Path path2 = Path();
//     path2.moveTo(0, size.height / 2);
//     path2.lineTo(0, size.height);
//     path2.lineTo(size.width, size.height);
//     path2.lineTo(size.width, size.height / 2);
//     path2.addArc(
//         Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2), 0.5 * 3.14, 3.14);
//     canvas.drawPath(path2, paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
