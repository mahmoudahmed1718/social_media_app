import 'package:flutter/material.dart';
import 'package:social_meda/core/helper/snak_bar_method.dart';
import 'package:social_meda/features/auth/presentation/manger/cubit/auth_cubit.dart';
import 'package:social_meda/features/auth/presentation/views/widgets/my_button.dart';
import 'package:social_meda/features/auth/presentation/views/widgets/my_text_filed.dart';

class RegsterPageBody extends StatefulWidget {
  const RegsterPageBody({super.key});

  @override
  State<RegsterPageBody> createState() => _RegsterPageBodyState();
}

class _RegsterPageBodyState extends State<RegsterPageBody> {
  bool isObscuredPw = true;
  bool isObscredConfirmPw = true;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pWController = TextEditingController();
  final confirmpWController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    pWController.dispose();
    confirmpWController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              children: [
                const SizedBox(height: 120),
                Icon(
                  Icons.lock_open_outlined,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 20),
                // welcome message
                Center(
                  child: Text(
                    'Let\'s create an account for you ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  textEditingController: nameController,
                  hintText: "Name",
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  textEditingController: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  textEditingController: pWController,
                  hintText: "Password",
                  obscureText: isObscuredPw,
                  iconButton: IconButton(
                    icon: Icon(
                      isObscuredPw ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () =>
                        setState(() => isObscuredPw = !isObscuredPw),
                  ),
                ),
                const SizedBox(height: 10),
                MyTextField(
                  textEditingController: confirmpWController,
                  hintText: "Confirm Password",
                  obscureText: isObscredConfirmPw,
                  iconButton: IconButton(
                    icon: Icon(
                      isObscredConfirmPw
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () => setState(
                      () => isObscredConfirmPw = !isObscredConfirmPw,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                MyButton(onTap: () {}, text: 'Rigester'),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'have an account? ',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        ' Login now',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    final String name = nameController.text;
    final String email = emailController.text;
    final String pw = pWController.text;
    final String confirmPw = confirmpWController.text;

    // authcubit
    // final authcubit = context.read<AuthCubit>();
    // ensure password confirm
    if (email.isNotEmpty &&
        name.isNotEmpty &&
        pw.isNotEmpty &&
        confirmPw.isNotEmpty) {
      if (pw == confirmPw) {
        // authcubit.register(name, email, pw);
      } else {
        snakBarMethod(context: context, message: 'passwords do not match');
      }
    } else {
      snakBarMethod(context: context, message: 'fill all the fields');
    }
  }
}
