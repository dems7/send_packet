import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:send_packet/utils/popups/loaders.dart';
import 'package:send_packet/data/repositories/authentication/authentication_repository.dart';
import 'package:send_packet/data/repositories/user/user_repository.dart';
import 'package:send_packet/features/authentification/screens/signup/verify_email.dart';
import 'package:send_packet/features/personalization/models/user_model.dart';
//import 'package:send_packet/utils/constants/image_strings.dart';
import 'package:send_packet/utils/helpers/network_manager.dart';
//import 'package:send_packet/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //variables
  final hidePassword = true.obs; //observable pour montrer/cacher mdp.
  final privacyPolicy = true.obs; //observable pour l'accord privacy policy
  final email = TextEditingController(); // Controller for email
  final lastName = TextEditingController(); // Controller for lastName
  final selectedRole = 'voyageur'.obs;
  final username = TextEditingController(); // Controller for username
  final password = TextEditingController(); // Controller for password
  final firstName = TextEditingController(); // Controller for firstName
  final phoneNumber = TextEditingController(); // Controller for phoneNumber
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for form validation

  //SignUp
  void signup() async {
    try {
      //Start Loading
      //TFullScreenLoader.openLoadingDialog('We are processing your information...', Images.docerAnimation);

      //Check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        //TFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (signupFormKey.currentState!.validate()) {
        // Remove Loader
        // TFullScreenLoader.stopLoading();
        return;
      }

      //privacy policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'Pour la creation du compte, vous devez lire et accepter la politique de confidentialite et les termes d\'utilisation');
        return;
      }

      //Register user in firebase Auth & save user data
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //save authenticated user data in the firebase firestore
      final controller = Get.find<SignupController>();
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        role: controller.selectedRole.value.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //remove loader
      //TFullScreenLoader.stopLoading();

      //show success message
      TLoaders.successSnackBar(
          title: 'felicitation',
          message:
              'votre compte est cree! verifiez votre boite mail pour continuer');

      //move to verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // remove loader
      //TFullScreenLoader.stopLoading();

      // show some generic error to the user
      TLoaders.errorSnackBar(title: 'Oups!', message: e.toString());
    }
  }
}
