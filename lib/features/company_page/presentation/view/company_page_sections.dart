import 'package:career/core/widgets/custom_tap_container_button.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/features/company_page/presentation/manager/company_cubit.dart';
import 'package:career/features/company_page/presentation/manager/company_state.dart';
import 'package:career/features/company_page/presentation/view/about_view.dart';
import 'package:career/features/company_page/presentation/view/company_jobs_view.dart';
import 'package:career/features/company_page/presentation/view/company_page_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyPageSections extends StatelessWidget {
  const CompanyPageSections({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyCubit, CompanyState>(
      builder: (context, state) {
        return Column(
          children: [
            PrimaryContainer(
              margin: const EdgeInsets.all(0),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r)),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context)
                      .colorScheme
                      .shadow
                      .withValues(alpha: 0.06), // Shadow color
                  spreadRadius: -5, // Spread radius
                  blurRadius: 12, // Blur radius
                  offset:
                      const Offset(0, -6), // Offset to create a shadow below
                ),
              ],
              child: CustomTapContainerButton(
                selectedIndex:
                    BlocProvider.of<CompanyCubit>(context).selectIndex,
                length: 3,
                tabTitles: [
                  'Home',
                  'About',
                  'Jobs',
                ],
                onTap: (index) {
                  context.read<CompanyCubit>().changeTap(index: index);
                  DefaultTabController.of(context).animateTo(index);
                },
              ),
            ),
            // 33.verticalSpace,
            const Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  // Home
                  CompanyPageHomeView(),
                  // About
                  ApoutView(),
                  // Jobs
                  CompanyJobsView(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
