import 'package:career/features/company_page/presentation/widget/company_page_home_item.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CompanyPageHomeView extends StatelessWidget {
  const CompanyPageHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          10,
          (index) {
            return CompanyPageHomeItem(
              path: Assets.images.aramedia.path,
              description:
                  'Aramco Digital, Armada, and Microsoft Collaborate to Deploy World’s First Industrial Distributed Cloud to Accelerate Digital Transformation',
            );
          },
        ),
      ),
    );
  }
}
