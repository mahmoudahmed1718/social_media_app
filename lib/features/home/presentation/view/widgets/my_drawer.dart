import 'package:flutter/material.dart';

import 'package:social_meda/core/helper/logout_helper.dart';

import 'package:social_meda/features/home/presentation/view/widgets/my_drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              // logo
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Icon(
                  Icons.person,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Divider(color: Theme.of(context).colorScheme.secondary),
              // home tile
              MyDrawerTile(
                title: 'H O M E',
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),
              // profile tile
              MyDrawerTile(
                title: 'P R O F I L E',
                icon: Icons.person,
                onTap: () {
                  Navigator.pop(context);
                  // navigate to profile page

                  //! should Navigate to profile page
                },
              ),
              // search tile
              MyDrawerTile(
                title: 'S E A R C H',
                icon: Icons.search,
                onTap: () {},
              ),
              //setting tile
              MyDrawerTile(
                title: 'S E T T I N G',
                icon: Icons.settings,
                onTap: () {},
              ),
              const Spacer(),
              // logout tile
              MyDrawerTile(
                title: 'L O G O U T',
                icon: Icons.logout, // better than login for logout action
                onTap: () async {
                  await LogoutHelper.showLogoutDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
