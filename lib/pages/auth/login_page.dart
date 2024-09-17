import 'package:baia_ui/constants.dart';
import 'package:baia_ui/services/auth/auth_service.dart';
import 'package:baia_ui/widgets/io/app_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  void login(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInWithEmail(
          emailController.text, passwordController.text);
    } catch (e) {
      showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "¡Hola! Bienvenido a",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    // height: 70,
                    // width: 100,
                    decoration: BoxDecoration(
                      color: mainBlueColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 23),
                      child: Image.asset(
                        "assets/baiaClearBg.png",
                        width: 80,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Inicia sesion...",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                ),
             
                const SizedBox(
                  height: 10,
                ),

                AppTextField(
                  hintText: "Correo",
                  controller: emailController,
                ),

                const SizedBox(
                  height: 10,
                ),

                AppTextField(
                  hintText: 'Contraseña',
                  controller: passwordController,
                  isPassword: true,
                  onSubmitted: (p0) => login(context),
                ),

                const SizedBox(
                  height: 10,
                ),

                const SizedBox(
                  height: 30,
                ),
                // AppButton(
                //   text: "Register",
                //   onPressed: () => register(context),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 20)),
                      backgroundColor: MaterialStatePropertyAll(mainBlueColor),
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6))
                      ))
                    ),
                      onPressed: () => login(context),
                      child: const Text("Log in")),
                ),


                Divider(
                  indent: MediaQuery.of(context).size.width * 0.15,
                  endIndent: MediaQuery.of(context).size.width * 0.15,
                  ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 20)),
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6))
                      ))
                    ),
                      onPressed: onTap,
                      child: const Text("No tengo una cuenta")),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

                Text("Reporta un problema", style: hyperlinkTextStyle,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}