import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CommonTextFormField extends StatefulWidget {
  const CommonTextFormField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.validator,
      this.obscureText,
      this.maxLength,
      this.errorText,
      this.maxLines = 1,
      this.textAlign = false,
      this.onChanged,
      this.enabled,
      this.keyboardType = TextInputType.text,
      this.prefix,
      this.inputFormatter});

  final String hintText;
  final String? errorText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? Function(String)? onChanged;
  final bool? obscureText;
  final bool? textAlign;
  final bool? enabled;
  final int? maxLength;
  final int? maxLines;
  final TextInputType keyboardType;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatter;

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: const TextStyle(
          fontFamily: "",
          fontSize: 14,
        ),
        validator: widget.validator,
        inputFormatters: widget.inputFormatter,
        onChanged: widget.onChanged,
        cursorColor: Theme.of(context).primaryColor,
        controller: widget.controller,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        enabled: widget.enabled,
        keyboardType: widget.keyboardType,
        textAlign:
            widget.textAlign == true ? TextAlign.center : TextAlign.start,
        obscuringCharacter: "*",
        obscureText: widget.obscureText == true ? !passwordVisible : false,
        decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).cardColor,
            hintText: widget.hintText.tr,
            errorText: widget.errorText,
            errorStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.error),
            hintStyle: TextStyle(
                fontFamily: "regular", color: Theme.of(context).hintColor),
            counterText: "",
            contentPadding: const EdgeInsets.only(left: 15),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).hintColor,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColor, width: 2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error, width: 1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            suffixIcon: showPassword(),
            prefixIcon: widget.prefix),
      ),
    );
  }

  bool passwordVisible = false;

  Widget showPassword() {
    if (widget.obscureText == true) {
      return ButtonTheme(
          child: TextButton(
              style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
              onPressed: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
              child: Icon(
                passwordVisible == true
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Theme.of(context).hintColor.withOpacity(.3),
              )));
    } else {
      return const SizedBox.shrink();
    }
  }
}
