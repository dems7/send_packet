import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:send_packet/features/sendpacket_contents/screens/annonce.dart';
import 'package:send_packet/features/sendpacket_contents/screens/commande.dart';
import 'package:send_packet/features/sendpacket_contents/screens/home/home.dart';
import 'package:send_packet/features/sendpacket_contents/screens/settings_screen.dart';
import 'package:send_packet/features/sendpacket_contents/screens/voyageur_screen/voyage.dart';

class HomeMenuVoyageur extends StatelessWidget {
  const HomeMenuVoyageur({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppScreenController());
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          animationDuration: const Duration(seconds: 3),
          selectedIndex: controller.selectedMenu.value,
          backgroundColor: Colors.white,
          elevation: 0,
          indicatorColor: Colors.black.withOpacity(0.1),
          onDestinationSelected: (index) =>
              controller.selectedMenu.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.box), label: 'commande'),
            NavigationDestination(
                icon: Icon(Iconsax.airplane5), label: 'voyage'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedMenu.value]),
    );
  }
}

class AppScreenController extends GetxController {
  static AppScreenController get instance => Get.find();

  final Rx<int> selectedMenu = 0.obs;

  final screens = [HomeScreen(), Commande(), Voyage(), SettingsScreen()];
}
