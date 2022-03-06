import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:products_task/Configs/app_colors.dart';
import 'package:products_task/Configs/app_pages.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: GetMaterialApp(
        title: 'Manage Products',
        theme: ThemeData(
          dividerColor: Colors.transparent,
          dividerTheme: DividerThemeData(
            color: Colors.grey[200],
          ),
          primaryColor: AppColors.primary,
          brightness: Brightness.light,
          backgroundColor: AppColors.white,
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: AppColors.primary,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Cairo',
          canvasColor: AppColors.white,
          cardColor: Colors.white,
          iconTheme: const IconThemeData(
            color: AppColors.textBlack,
            size: 25,
          ),
          appBarTheme: const AppBarTheme(
            centerTitle: false, // 1
            iconTheme: IconThemeData(
              color: AppColors.textBlack,
              size: 22,
            ),
            actionsIconTheme: IconThemeData(
              color: AppColors.textBlack,
              size: 22,
            ),
            color: Colors.white,
            elevation: 0, systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppColors.primary,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.inputBorderColor,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primary,
              ),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.initial,
        getPages: AppPages.appPages,
        navigatorObservers: <RouteObserver<ModalRoute<void>>>[routeObserver],
      ),
    );
  }
}

final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();
