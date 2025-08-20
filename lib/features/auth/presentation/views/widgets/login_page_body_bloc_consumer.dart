import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_meda/core/helper/snak_bar_method.dart';
import 'package:social_meda/features/auth/presentation/manger/cubit/auth_cubit.dart';
import 'package:social_meda/features/auth/presentation/views/widgets/login_page_body.dart';

class LoginPageBodyBlocConsumer extends StatelessWidget {
  const LoginPageBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          snakBarMethod(context: context, message: state.message);
        } else if (state is AuthSuccess) {
          snakBarMethod(context: context, message: 'login successfully');
        }
      },
      builder: (context, state) {
        return LoginPageBody();
      },
    );
  }
}
