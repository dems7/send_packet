import 'package:flutter/material.dart';
import 'package:send_packet/common/styles/spacing_style.dart';
import 'package:send_packet/common/widgets/login_signup/form_divider.dart';
import 'package:send_packet/common/widgets/login_signup/social_buttons.dart';
import 'package:send_packet/features/authentification/screens/login/widgets/login_form.dart';
import 'package:send_packet/features/authentification/screens/login/widgets/login_header.dart';
import 'package:send_packet/utils/constants/sizes.dart';
import 'package:send_packet/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///  Header logo, titre, sous titre
              LoginHeader(),

              /// Form
              LoginForm(),

              /// Divider
              FormDivider(dividerText: TTexts.orSignInWith),
              SizedBox(height: TSizes.spaceBtwSections),

              /// Footer
              SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
