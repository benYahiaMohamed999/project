// ignore_for_file: must_be_immutable, file_names

import 'package:e_commerce_app/layout/home/HomePage.dart';
import 'package:e_commerce_app/layout/registerScreen/registerScreen.dart';
import 'package:e_commerce_app/modules/login/loginCubit.dart';
import 'package:e_commerce_app/modules/login/loginState.dart';
import 'package:e_commerce_app/shared/componets/buttonFacebook.dart';
import 'package:e_commerce_app/shared/componets/myTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  
  LoginScreen({super.key,});

  var emailControler = TextEditingController();
  var passwordControler = TextEditingController();

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
                      'Login',
                      style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
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
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    icon: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 60,
                      width: double.infinity,
                      child: const Center(
                        child: Text('Login'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('_______________Or login with_______________'),
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
                        "Don't have an acount ?",
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Sign up',
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
