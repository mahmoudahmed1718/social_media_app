import 'package:flutter/material.dart';
import 'package:social_meda/features/auth/presentation/views/widgets/my_button.dart';
import 'package:social_meda/features/auth/presentation/views/widgets/my_text_filed.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  final emailController = TextEditingController();
  final pWController = TextEditingController();
  bool isObscured = true;
  bool isLoading = false;

  @override
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    pWController.dispose();
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
                const SizedBox(height: 150),
                Icon(
                  Icons.lock_open_outlined,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    'Welcome back, you have missed!',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  textEditingController: emailController,
                  hintText: "Email",
                ),
                const SizedBox(height: 10),
                MyTextField(
                  textEditingController: pWController,
                  hintText: "Password",
                  obscureText: isObscured,
                  iconButton: IconButton(
                    icon: Icon(
                      isObscured ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () => setState(() => isObscured = !isObscured),
                  ),
                ),
                const SizedBox(height: 25),
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : MyButton(onTap: () {}, text: 'Login'),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'have not an account? ',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        '  Register now',
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
}
