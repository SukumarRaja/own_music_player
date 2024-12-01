import 'package:flutter/gestures.dart';
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

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AuthController(),
        initState: (_) {},
        builder: (_) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).cardColor,
              body: ListView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          margin: const EdgeInsets.all(15),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppFontSize.radiusDefault),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.070)),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 24,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppFontSize.paddingSizeDefault),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: 'setup_account',
                          fontWeight: FontWeight.w600,
                          fontSize: AppFontSize.fontSizeOverLarge,
                        ),
                        const SizedBox(height: 10),
                        CommonText(
                          text: 'complete_account',
                          fontSize: AppFontSize.fontSizeSmall,
                          fontColor: Theme.of(context).hintColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppFontSize.paddingSizeDefault),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: 'name',
                            fontWeight: FontWeight.w600,
                            fontSize: AppFontSize.fontSizeDefault,
                          ),
                          CommonTextFormField(
                            hintText: 'enter_name',
                            controller: AuthController.to.name,
                            validator: (data) {
                              return nameValidator(value: data);
                            },
                          ),
                          CommonText(
                              text: 'email',
                              fontWeight: FontWeight.w600,
                              fontSize: AppFontSize.fontSizeDefault),
                          CommonTextFormField(
                            hintText: 'enter_email',
                            controller: AuthController.to.name,
                            keyboardType: TextInputType.emailAddress,
                            validator: (data) {
                              return emailValidator(value: data);
                            },
                          ),
                          CommonText(
                            text: 'phone',
                            fontWeight: FontWeight.w600,
                            fontSize: AppFontSize.fontSizeDefault,
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
                          CommonText(
                            text: 'password',
                            fontWeight: FontWeight.w600,
                            fontSize: AppFontSize.fontSizeDefault,
                          ),
                          CommonTextFormField(
                            hintText: 'enter_password',
                            controller: AuthController.to.name,
                            obscureText: true,
                            validator: (data) {
                              return passwordValidator(value: data);
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(() => Checkbox(
                                  value: AuthController.to.termsAndConditions,
                                  activeColor: Theme.of(context).primaryColor,
                                  onChanged: (data) {
                                    AuthController.to.termsAndConditions = data;
                                  })),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'accept'.tr,
                                      style: TextStyle(
                                          color: Theme.of(context).hintColor,
                                          fontFamily: 'medium'),
                                    ),
                                    TextSpan(
                                        text: 't_and_c'.tr,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontFamily: 'medium'),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            launch(
                                                url:
                                                    "https://demos.co.uk/terms-conditions/");
                                          }),
                                    TextSpan(
                                      text: 'and'.tr,
                                      style: TextStyle(
                                          color: Theme.of(context).hintColor,
                                          fontFamily: 'medium'),
                                    ),
                                    TextSpan(
                                      text: 'privacy_policy'.tr,
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontFamily: 'medium'),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          launch(
                                              url:
                                                  "https://demos.co.uk/privacy-policy/");
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Obx(
                            () => CommonButton(
                              text: "sign_in",
                              color: AuthController.to.termsAndConditions
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).hintColor,
                              onPressed: AuthController.to.termsAndConditions
                                  ? () {}
                                  : () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
