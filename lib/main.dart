import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:products_task/Configs/app_pages.dart';
import 'package:products_task/Helpers/app_theme.dart';
import 'package:products_task/Helpers/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Check if you received the link via `getInitialLink` first
  final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
  if (initialLink != null) {
    final Uri deepLink = initialLink.link;
    // Example of using the dynamic link to push the user to a different screen
    debugPrint(deepLink.path.toString());
  }

  FirebaseDynamicLinks.instance.onLink.listen(
    (pendingDynamicLinkData) {
      // Set up the `onLink` event listener next as it may be received here
      if (pendingDynamicLinkData != null) {
        final Uri deepLink = pendingDynamicLinkData.link;
        // Example of using the dynamic link to push the user to a different screen
        debugPrint(deepLink.path.toString());
      }
    },
  ).onError((error) {
    // Handle errors
  });

  // Initializing Get Storage
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Added for Un-Focus fields and hiding keyboard
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Utils.unFocus(context);
      },
      child: GetMaterialApp(
        theme: AppTheme.lightTheme(), // Light theme
        darkTheme: AppTheme.darkTheme(), //Dart theme
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.initial, // Start page of the app
        getPages: AppPages.appPages, // List of pages for Navigation
        navigatorObservers: <RouteObserver<ModalRoute<void>>>[routeObserver], // Route observer
      ),
    );
  }
}

final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();
