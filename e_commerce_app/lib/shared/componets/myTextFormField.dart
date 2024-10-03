// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
      {super.key,
      required this.enableColor,
      required this.focusedColor,
      this.title,
      required this.varContoller,
      required this.type,
      required this.onChanged,
      required this.label,
      required this.suffix,
      this.perfix,
      required this.errorForm});

  final String? title;
  final Color enableColor;
  final Color focusedColor;
  final dynamic varContoller;
  final TextInputType type;
  final Function(String value) onChanged;

  final Text label;
  final Widget suffix;
  final Widget? perfix;
  final String errorForm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return ('Please enter your $errorForm');
          }
          return null;
        },
        onChanged: onChanged,
        onFieldSubmitted: (value) {},
        controller: varContoller,
        keyboardType: type,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          label: label,
          hintText: title,
          suffix: suffix,
          prefix: perfix,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 13,
            horizontal: 20,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
            borderSide: BorderSide(
              width: 1,
              color: Colors.black,
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
            borderSide: BorderSide(
              color: focusedColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyTextFormFieldPassword extends StatelessWidget {
  MyTextFormFieldPassword(
      {super.key,
      required this.enableColor,
      required this.focusedColor,
      this.title,
      required this.varContoller,
      required this.type,
      required this.suffix,
      required this.obscureCubit,
      required this.onTap,
      required this.onChanged,
      required this.label});

  final String? title;
  final Color enableColor;
  final Color focusedColor;
  final dynamic varContoller;
  final TextInputType type;
  final Icon suffix;
  final bool obscureCubit;
  final VoidCallback onTap;
  final Function(String value) onChanged;
  final Text label;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return ('password is to short');
          }
          return null;
        },
        onChanged: onChanged,
        controller: varContoller,
        keyboardType: type,
        textAlign: TextAlign.center,
        obscureText: obscureCubit,
        onFieldSubmitted: (value) {},
        decoration: InputDecoration(
          label: label,
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: suffix,
          ),
          hintText: title,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 13,
            horizontal: 20,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
            borderSide: BorderSide(color: enableColor, width: 1),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
            borderSide: BorderSide(
              color: focusedColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
