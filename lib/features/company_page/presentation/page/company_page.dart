import 'package:career/core/widgets/primary_container.dart';
import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/features/company_page/presentation/manager/company_cubit.dart';
import 'package:career/features/company_page/presentation/view/company_page_sections.dart';
import 'package:career/features/company_page/presentation/widget/company_page_descriptive_data.dart';
import 'package:career/features/company_page/presentation/widget/company_page_image_and_background.dart';
import 'package:career/features/company_page/presentation/widget/view_site.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyPage extends StatelessWidget {
  const CompanyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: PrimaryContainer(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        padding: const EdgeInsets.all(0),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0), topRight: Radius.circular(0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CompanyPageImageAndBackground(),
            5.verticalSpace,
            const CompanyPageDescriptiveData(),
            10.verticalSpace,
            const ViewSite(),
            45.verticalSpace,
            5.verticalSpace,
            Expanded(
              child: BlocProvider(
                create: (context) => CompanyCubit(),
                child: const DefaultTabController(
                  length: 3,
                  child: CompanyPageSections(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
