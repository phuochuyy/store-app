import 'package:TShop/common/styles/spacing_styles.dart';
import 'package:TShop/utils/constants/colors.dart';
import 'package:TShop/utils/constants/image_string.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:TShop/utils/constants/text_string.dart';
import 'package:TShop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(
                    dark ? TImages.darkAppLogo : TImages.lightAppLogo),
                height: 150,
              ),
              Text(
                TTexts.loginTittle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.sm,
              ),
              Text(
                TTexts.loginSubTittle,
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),

          /// Form
          Form(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
              child: Column(children: [
                ///Email
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.email,
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),

                ///Password
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.password_check),
                      labelText: TTexts.password,
                      suffixIcon: Icon(Iconsax.eye_slash)),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields / 2,
                ),

                ///Remember me and forget password
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///Remember me
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Checkbox(value: true, onChanged: (value) {}),
                        const Text(TTexts.rememberMe)
                      ],
                    ),

                    ///Forget password
                    TextButton(
                        onPressed: () {},
                        child: const Text(TTexts.forgetPassword))
                  ],
                ),

                ///Sign in button
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text(TTexts.signIn))),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                ///Sign up button
                SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {},
                        child: const Text(TTexts.createAccount))),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                )
              ]),
            ),
          ),

          ///Devider
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Divider(
                color: dark ? TColors.darkGrey : TColors.grey,
                thickness: 0.5,
                indent: 60,
                endIndent: 5,
              )
            ],
          ),

          ///Footer
          
          
        ],
      ),
    )));
  }
}
