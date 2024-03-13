import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:send_packet/bindings/general_bindings.dart';
import 'data/repositories/authentication/authentication_repository.dart';
import 'package:send_packet/features/authentification/screens/login/login.dart';
import 'package:send_packet/firebase_options.dart';
import 'package:send_packet/utils/constants/text_strings.dart';
import 'package:send_packet/utils/theme/theme.dart';

Future<void> main() async {
  //Widget binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //Initialisation firebase & authentification repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      initialBinding: GeneralBindings(),
      home: const LoginScreen(),
    );
  }
}
