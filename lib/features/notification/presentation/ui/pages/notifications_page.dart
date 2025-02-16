import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      backgroundImage: DecorationImage(
        image: AssetImage(
          Assets.images.homeScreen.path,
        ),
        fit: BoxFit.cover,
      ),
      body: const CustomScrollView(
        slivers: [
          // AppBarView(),
          // PostsListView(),
        ],
      ),
    );
  }
}