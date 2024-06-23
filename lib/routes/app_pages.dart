import 'package:get/get.dart';
import 'package:spectrumtask/routes/app_routes.dart';
import 'package:spectrumtask/screens/home_screens/home_screen.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.HomeScreen,
      page: () => HomeScreen(),
    ),

  ];
}
