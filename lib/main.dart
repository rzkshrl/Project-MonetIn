import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_monetin/app/controller/auth_controller.dart';
import 'package:project_monetin/app/modules/home/views/home_view.dart';
import 'package:project_monetin/app/utils/loading.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/app_themes.dart';
import 'app/theme/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: background),
        child: StreamBuilder<User?>(
            stream: authC.streamAuthStatus,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                print(snapshot.data);
                return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: "MonetIn",
                  initialRoute:
                      snapshot.data != null ? Routes.HOME : Routes.LOGIN,
                  getPages: AppPages.routes,
                  theme: AppThemes.light,
                  darkTheme: AppThemes.dark,
                  themeMode: ThemeMode.system,
                  home: HomeView(),
                );
              }
              return LoadingView();
            }));
  }
}

// class SplashScreen extends StatelessWidget {
//   final authC = Get.put(AuthController(), permanent: true);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//         stream: authC.streamAuthStatus,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.active) {
//             print(snapshot.data);
//             return AnnotatedRegion(
//               value: SystemUiOverlayStyle(
//                   statusBarIconBrightness: Brightness.dark,
//                   statusBarColor: background),
//               child: AnimatedSplashScreen(
//                 animationDuration: Duration(seconds: 1),
//                 splash: 'assets/icons/iconRevert.png',
//                 backgroundColor: backgroundDark,
//                 nextScreen: snapshot.data != null &&
//                         snapshot.data!.emailVerified == true
//                     ? HomeView()
//                     : LoginView(),
//                 splashIconSize: 334,
//                 splashTransition: SplashTransition.fadeTransition,
//                 pageTransitionType: PageTransitionType.leftToRight,
//               ),
//             );
//           }
//           return LoadingView();
//         });
//   }
// }
