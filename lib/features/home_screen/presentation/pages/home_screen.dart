import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/features/home_screen/presentation/widgets/post_widget.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      backgroundImage: DecorationImage(
        image: AssetImage(Assets.images.homeScreen.path),
        fit: BoxFit.cover,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
              ),
            ),
            SliverList.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
                );
              },
              itemCount: 10,
              itemBuilder: (context, index) {
                return const PostWidget();
              },
            ),
          ],
        ),
      ),
    );
  }
}
