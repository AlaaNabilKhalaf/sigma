import 'package:flutter/material.dart';
import 'package:sigma/views/widgets/home_widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async { return false; },
      child: const Scaffold(
        body: HomeViewBody(),
      ),
    );
  }
}
