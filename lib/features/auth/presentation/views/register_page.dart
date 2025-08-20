import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_meda/core/services/get_it_service.dart';
import 'package:social_meda/features/auth/domain/repos/auth_repo.dart';
import 'package:social_meda/features/auth/presentation/manger/cubit/auth_cubit.dart';
import 'package:social_meda/features/auth/presentation/views/widgets/regster_page_body.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(authRepo: getIt.get<AuthRepo>()),
        child: RegsterPageBody(),
      ),
    );
  }
}
