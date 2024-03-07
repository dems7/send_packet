import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:send_packet/common/widgets/loaders/loaders.dart';
import 'package:send_packet/utils/constants/image_strings.dart';
import 'package:send_packet/utils/helpers/network_manager.dart';
import 'package:send_packet/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //variables
  final email = TextEditingController(); // Controller for email
  final lastName = TextEditingController(); // Controller for lastName
  final username = TextEditingController(); // Controller for username
  final password = TextEditingController(); // Controller for password
  final firstName = TextEditingController(); // Controller for firstName
  final phoneNumber = TextEditingController(); // Controller for phoneNumber
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for form validation

  //SignUp
  signup() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', Images.appLogo);

      //Check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      //form validation
      if (signupFormKey.currentState!.validate()) return;

      //privacy policy check

      //Register user in firebase Auth & save user data

      //save authenticated user data in the firebase firestore

      //show success message

      //move to verify Email Screen
    } catch (e) {
      // show some generic error to the user
      TLoaders.errorSnackBar(title: 'On sanp!', message: e.toString());
    } finally {
      // remove loader
      TFullScreenLoader.stopLoading();
    }
  }
}
