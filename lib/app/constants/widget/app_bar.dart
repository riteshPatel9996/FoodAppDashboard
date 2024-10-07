import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  AppBarWidgetState createState() => AppBarWidgetState();
}

class AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Color(0xffFFFAFA),
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      backgroundColor: const Color(0xffFFFAFA),
      title: Image.asset(
        'assets/images/appBar/app_icon.png',
        height: 53,
        width: 70,
      ),
      actions: [
        Image.asset('assets/images/appBar/wallet.png', height: 20, width: 22),
        const SizedBox(width: 10),
        Image.asset('assets/images/appBar/translate.png', height: 20, width: 22),
        const SizedBox(width: 10),
        Image.asset('assets/images/appBar/notification.png', height: 20, width: 22),
        const SizedBox(width: 10),
      ],
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Image.asset('assets/images/appBar/menu.png',height: 36,width: 36),
      ),
    );
  }
}
