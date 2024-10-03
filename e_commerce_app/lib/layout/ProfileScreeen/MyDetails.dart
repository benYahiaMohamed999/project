// ignore_for_file: must_be_immutable, file_names

import 'package:e_commerce_app/shared/componets/ChangePasswordScreen.dart';
import 'package:e_commerce_app/shared/componets/NewButtom.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class MyDetails extends StatelessWidget {
  MyDetails({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Details"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  phoneNumber = number.phoneNumber;
                },
                selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    useEmoji: true,
                    useBottomSheetSafeArea: true,
                    showFlags: true,
                    leadingPadding: 20,
                    setSelectorButtonAsPrefixIcon: false,
                    trailingSpace: true),
                ignoreBlank: false,
                onInputValidated: (bool value) {
                  if (!value) {
                    // Invalid phone number
                    debugPrint('Invalid phone ??number');
                  }
                },
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: const TextStyle(color: Colors.black),
                initialValue: PhoneNumber(isoCode: 'TN'),
                textFieldController: TextEditingController(text: phoneNumber),
                formatInput: false,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputDecoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Phone Number",
                ),
                onSaved: (PhoneNumber number) {
                  debugPrint('On Saved: $number');
                },
              ),
              const SizedBox(height: 250),
              NewButtom(
                color: Colors.green,
                label: "Update",
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('your Data updated with success'),
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.all(16),
                      animation: AlwaysStoppedAnimation(2),
                      duration: Durations.long1,
                    ));
                    // Process data
                    debugPrint('Username: ${_usernameController.text}');
                    debugPrint('Name: ${_nameController.text}');
                    debugPrint('Phone Number: $phoneNumber');
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              NewButtom(
                color: Colors.green,
                label: "Change Password",
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    // Process data
                    debugPrint('Username: ${_usernameController.text}');
                    debugPrint('Name: ${_nameController.text}');
                    debugPrint('Phone Number: $phoneNumber');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePasswordScreen()),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
