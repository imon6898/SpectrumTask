import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  String title = 'Home';
  final Map<int, bool> _isExpanded = {
    0: false,
    1: false,
    2: false,
    3: false,
    4: false,
  };

  bool isExpanded(int index) {
    return _isExpanded[index] ?? false;
  }

  void toggleExpanded(int index) {
    _isExpanded[index] = !_isExpanded[index]!;
    update();
  }
}
