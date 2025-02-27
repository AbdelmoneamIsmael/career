import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/features/candidates/presentation/widgets/candidate_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CandidatesPage extends StatelessWidget {
  const CandidatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        appBar: AppBar(
          title: const Text('Candidates'),
        ),
        body: SingleChildScrollView(
          child: AnimationLimiter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15.h,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 700),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: List.generate(
                    10,
                    (index) => CandidateItem(
                      jobDescription: "Flutter Developer",
                      name: "John Doe",
                      isPremium: index < 5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}