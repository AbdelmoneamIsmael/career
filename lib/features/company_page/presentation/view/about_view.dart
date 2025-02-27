import 'package:career/features/company_page/presentation/widget/descriptive_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApoutView extends StatelessWidget {
  const ApoutView({
    super.key,
  });
  static const List<DescriptiveItem> aboutList = [
    DescriptiveItem(
      title: 'Overview',
      description:
          'We’re a leading producer of the energy and chemicals that drive global commerce and enhance the daily lives of people around the globe by continuing delivering an uninterrupted supply of energy to the world.\nOur resilience and agility has built one of the world’s largest integrated energy and chemicals companies. And we are part of the global effort toward building a low carbon economy.',
    ),
    DescriptiveItem(
      title: 'Industry',
      description: 'Oil and Gas',
    ),
    DescriptiveItem(
      title: 'Company size',
      description: '10,001+ employees',
    ),
    DescriptiveItem(
      title: 'Specialties',
      description:
          'Oil Exploration, Drilling and Workover, Renewable Energy, Petroleum Engineering, Pipelines and Distribution, Refining, Project Management, Nursing, Medical and Dental, Gas Operations, Chemicals, Research & Development, Marine, Unconventional Gas, and Power Systems',
    ),
    DescriptiveItem(
      title: 'Location',
      description: 'iraq',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SingleChildScrollView(
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.verticalSpace,
            ...aboutList.map((e) => e),
          ],
        ),
      ),
    );
  }
}