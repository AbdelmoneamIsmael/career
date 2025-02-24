import 'package:career/core/widgets/custom_tap_container_button.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/features/company_page/presentation/manager/company_cubit.dart';
import 'package:career/features/company_page/presentation/manager/company_state.dart';
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
      topSafeArea: true,
      body: PrimaryContainer(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        padding: const EdgeInsets.all(0),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CompanyPageImageAndBackground(),
            5.verticalSpace,
            const CompanyPageDescriptiveData(),
            10.verticalSpace,
            const ViewSite(),
            50.verticalSpace,
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
                  color: Colors.black.withValues(alpha: 0.1), // Shadow color
                  spreadRadius: 2, // Spread radius
                  blurRadius: 8, // Blur radius
                  offset:
                      const Offset(0, -2), // Offset to create a shadow below
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
            33.verticalSpace,
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // نقل داخلي
                  // DriverInternalTransportView(),
                  Container(child: const Text('data1')),
                  // نقل خارجي
                  // DriverExternalTransportView(),
                  Container(child: const Text('data2')),
                  Container(child: const Text('data3')),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}