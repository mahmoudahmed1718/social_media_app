import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_meda/core/helper/snak_bar_method.dart';
import 'package:social_meda/core/widgets/custom_modal_progress_hud.dart';
import 'package:social_meda/features/auth/presentation/manger/cubit/auth_cubit.dart';
import 'package:social_meda/features/auth/presentation/views/widgets/regster_page_body.dart';

class RegsterPageBodyBlocConsumer extends StatelessWidget {
  const RegsterPageBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          snakBarMethod(context: context, message: state.message);
        } else if (state is AuthSuccess) {
          snakBarMethod(
            context: context,
            message: 'account created successfully',
          );
        }
      },
      builder: (context, state) {
        return CustomModalProgrssHud(
          isLoading: state is AuthLoading ? true : false,
          child: RegsterPageBody(),
        );
      },
    );
  }
}
