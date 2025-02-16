import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/features/home_screen/presentation/views/app_bar_view.dart';
import 'package:career/features/home_screen/presentation/views/posts_list_views.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          AppBarView(),
          PostsListView(),
        ],
      ),
    );
  }
}
