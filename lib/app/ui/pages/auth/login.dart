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
              const SizedBox(height: 10),
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
                        fontColor: Theme.of(context).hintColor,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Form(
                      key: AuthController.to.loginFormKey,
                      child: Column(
                        children: [
                          CommonTextFormField(
                            hintText: 'enter_name'.tr,
                            controller: AuthController.to.name,
                            validator: (data) {
                              return nameValidator(value: data);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: IntlPhoneField(
                              maxLength: 10,
                              hintText: 'enter_phone',
                              controller: AuthController.to.phone,
                              initialCountryCode: "IN",
                              fontFamily: "regular",
                              isEnableValidation: true,
                              onCountryChanged: (data) {
                                AuthController.to.countryCode =
                                    data.countryCode;
                              },
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
            ],
          ),
        ),
      ),
    );
  }
}
