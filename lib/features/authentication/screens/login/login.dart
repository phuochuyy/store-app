import 'package:TShop/common/styles/spacing_styles.dart';
import 'package:TShop/common/widgets/login_signup/form_devider.dart';
import 'package:TShop/features/authentication/screens/login/widgets/login_form.dart';
import 'package:TShop/features/authentication/screens/login/widgets/login_header.dart';
import 'package:TShop/common/widgets/login_signup/social_button.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:TShop/utils/constants/text_string.dart';
import 'package:TShop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: TSpacingStyle.paddingWithAppBarHeight,
      child: Column(
        children: [
          /// logo, title, subtitle
          TLoginHeader(dark: dark),

          /// Form
          const TLoginForm(),

          ///Devider
          TFormDevider(dividerText: TTexts.orSignInwith.capitalize!),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          ///Footer
          const TSocialButton()
        ],
      ),
    )));
  }
}







