import 'package:get/get.dart';
import 'package:spectrumtask/screens/home_screens/home_screens_controller/home_screen_controller.dart';

class ViewModelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(() => HomeScreenController(), fenix: true);
  }
}