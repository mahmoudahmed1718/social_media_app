import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_meda/features/profile/presentation/manger/cubit/profile_cubit.dart';
import 'package:social_meda/features/profile/presentation/view/widgets/profile_page_body.dart';

class ProfilePageBodyBlocBuilder extends StatelessWidget {
  const ProfilePageBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProfileLoaded) {
          return ProfilePageBody();
        } else if (state is ProfileError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Please wait...'));
        }
      },
    );
  }
}
