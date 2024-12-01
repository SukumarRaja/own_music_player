import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../controllers/auth.dart';
import '../../../themes/font_size.dart';
import '../../../utility/utility.dart';
import '../../widgets/common/button.dart';
import '../../widgets/common/intl_phone_field.dart';
import '../../widgets/common/text.dart';
import '../../widgets/common/textform_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppFontSize.paddingSizeDefault),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CommonText(
                        text: 'sign_account',
                        fontWeight: FontWeight.w600,
                        fontSize: AppFontSize.fontSizeExtraLarge,
                        fontColor: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Form(
                      key: AuthController.to.loginFormKey,
                      child: Column(
                        children: [
                          CommonTextFormField(
                            hintText: 'name'.tr,
                            controller: AuthController.to.name,
                            validator: (data) {
                              return emailValidator(value: data);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: IntlPhoneField(
                              maxLength: 10,
                              hintText: 'enter_phone',
                              controller: AuthController.to.phone,
                              initialCountryCode: "IN",
                              fontFamily: "medium",
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              validator: (data) {
                                if (data!.isEmpty || data == "") {
                                  return "phone_empty".tr;
                                } else if (data.length < 10) {
                                  return "phone_must_be".tr;
                                }
                                return null;
                              },
                              onCountryChanged: (data) {
                                print("country code: ${data.countryCode}");
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: CommonText(
                              text: 'forgot_password',
                              fontWeight: FontWeight.w600,
                              fontSize: AppFontSize.fontSizeDefault,
                              fontColor: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    CommonButton(
                        text: "sign_in",
                        onPressed: () {
                          Get.toNamed('/home-main');
                        }),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText(
                    text: "don't_have_account",
                    fontSize: AppFontSize.fontSizeDefault,
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      Get.toNamed('/register');
                    },
                    child: CommonText(
                      text: 'sign_up',
                      fontWeight: FontWeight.w600,
                      fontSize: AppFontSize.fontSizeDefault,
                      fontColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
