import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/features/company_page/presentation/widget/company_buttons.dart';
import 'package:career/features/company_page/presentation/widget/company_page_descriptive_data.dart';
import 'package:career/features/company_page/presentation/widget/company_page_image_and_background.dart';
import 'package:career/features/company_page/presentation/widget/view_site.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyPage extends StatelessWidget {
  const CompanyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      topSafeArea: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CompanyPageImageAndBackground(),
          5.verticalSpace,
          const CompanyPageDescriptiveData(),
          10.verticalSpace,
          const ViewSite(),
          10.verticalSpace,
          const Column(
            children: [
              CompanyButtons(),
            ],
          ),
        ],
      ),
    );
  }
}
