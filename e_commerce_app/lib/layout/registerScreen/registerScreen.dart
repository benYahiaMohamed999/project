// ignore_for_file: must_be_immutable, file_names

import 'package:e_commerce_app/layout/LoginScreen/LoginScreen.dart';
import 'package:e_commerce_app/modules/login/loginCubit.dart';
import 'package:e_commerce_app/modules/login/loginState.dart';
import 'package:e_commerce_app/shared/componets/buttonFacebook.dart';
import 'package:e_commerce_app/shared/componets/myTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  var emailControler = TextEditingController();
  var passwordControler = TextEditingController();
  var nameControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocBuilder<ShopLoginCubit, shopLoginState>(
        builder: (context, state) {
          var cubit = ShopLoginCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      'Create an acount ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  MyTextFormField(
                    errorForm: 'name',
                    enableColor: Colors.black,
                    focusedColor: Colors.black12,
                    onChanged: (value) {},
                    type: TextInputType.name,
                    varContoller: nameControler,
                    suffix: const Icon(Icons.person),
                    label: const Text('name'),
                  ),
                  MyTextFormField(
                    errorForm: 'E-mail Adress',
                    enableColor: Colors.black,
                    focusedColor: Colors.black12,
                    onChanged: (value) {},
                    type: TextInputType.emailAddress,
                    varContoller: emailControler,
                    suffix: const Icon(Icons.email),
                    label: const Text('E-mail Adress'),
                  ),
                  MyTextFormFieldPassword(
                    obscureCubit: cubit.isPassw,
                    onTap: () {
                      cubit.iconPassword();
                    },
                    enableColor: Colors.black,
                    focusedColor: Colors.grey,
                    onChanged: (value) {},
                    type: TextInputType.visiblePassword,
                    varContoller: passwordControler,
                    suffix: cubit.isPassw
                        ? const Icon(Icons.energy_savings_leaf)
                        : const Icon(Icons.remove_red_eye_outlined),
                    label: const Text('Password'),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forget Password',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: cubit.isChecked,
                        onChanged: (value) {
                          cubit.isChecked = value!;
                        },
                      ),
                      const Text(
                        'By continuing,you are agree to our ',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Terms & Condition',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 60,
                      width: double.infinity,
                      child: const Center(
                        child: Text('Register'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('_______________Or sign up with_______________'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buttonFacebook(
                        onPressed: () {},
                      ),
                      buttonGoogle(
                        onPressed: () {},
                      ),
                      buttonMac(
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an acount ?",
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Login',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
