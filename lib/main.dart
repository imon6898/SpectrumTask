import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spectrumtask/routes/app_pages.dart';
import 'package:spectrumtask/routes/app_routes.dart';
import 'package:spectrumtask/utlis/text_const.dart';
import 'binding/view_model_binding.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          translations: TextConst(),
          locale: const Locale('en', 'UK'),
          // translations will be displayed in that locale
          initialBinding: ViewModelBinding(),
          title: 'Shot Click',
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
          ),
          // initialRoute: AppRoutes.WelcomeScreen,
          initialRoute: AppRoutes.HomeScreen,
          getPages: AppPages.list,
        );
      },
    );
  }
}
