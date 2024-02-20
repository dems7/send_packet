import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:send_packet/common/widgets/appbar/appbar.dart';
import 'package:send_packet/features/authentification/screens/login/login.dart';
import 'package:send_packet/utils/constants/sizes.dart';
import 'package:send_packet/utils/constants/text_strings.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(TTexts.appName,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium),

            /// -- Logout Button
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const LoginScreen()),
                    child: const Text('Logout'))),
            const SizedBox(height: TSizes.spaceBtwSections * 2.5),
          ],
        ),
      ),
    );
  }
}
