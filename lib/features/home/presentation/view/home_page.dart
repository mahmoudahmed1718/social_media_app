import 'package:flutter/material.dart';
import 'package:social_meda/features/home/presentation/view/widgets/home_page_body.dart';
import 'package:social_meda/features/home/presentation/view/widgets/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Social Media")),
      body: HomePageBody(),
      drawer: MyDrawer(),
    );
  }
}
