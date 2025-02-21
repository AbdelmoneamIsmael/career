import 'dart:ui';

import 'package:career/core/app_texts/app_localizations.dart';
import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/primary_button.dart';
import 'package:career/core/widgets/primary_container.dart';
import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20).w,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: PrimaryButton(
          onPressed: () {},
          text: AppLocalizations.of(context).applyNow,
        ),
      ),
      backgroundImage: DecorationImage(
        image: AssetImage(
          Assets.images.applyImage.path,
        ),
        fit: BoxFit.cover,
        alignment: Alignment(lerpDouble(-.55, .1, 1.5)!, .8),
      ),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12.w,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(
                    Assets.images.profile.path,
                    height: 80.w,
                    width: 80.w,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Graphic Designer",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTextStyle.bold16(context),
                      ),
                      Text(
                        "Almahd Technology •",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTextStyle.regular12(context).copyWith(
                          color: Theme.of(context).textTheme.bodySmall!.color,
                        ),
                      ),
                      Text(
                        "12/12/2022 • 12 PM",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTextStyle.regular12(context).copyWith(
                          color: Theme.of(context).textTheme.bodySmall!.color,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        r'''About the job
        Job Description:
        
        We are looking for a skilled and motivated Mid-Level Flutter Developer to join our team. The ideal candidate will have a strong understanding of Flutter development, experience with state management (especially BLoC), and familiarity with Flutter for web. You will be responsible for developing, maintaining, and optimizing cross-platform mobile and web applications.
        
        Key Responsibilities:
        
        Design, develop, and maintain high-quality Flutter applications for mobile and web platforms
        Implement clean, efficient, and reusable code using best practices
        Work with the BLoC (Business Logic Component) pattern for state management
        Collaborate with designers, product managers, and other developers to deliver user-friendly and scalable applications
        Debug and resolve technical issues, ensuring optimal performance and responsiveness
        Stay updated with the latest trends and advancements in Flutter and mobile/web development
        Participate in code reviews and contribute to improving team processes
        
        
        Requirements
        
        Core Skills:
        2+ years of experience in Flutter development
        Strong understanding of Dart programming language
        Proficient in using the BLoC pattern for state management
        Experience with Flutter for web development
        Familiarity with RESTful APIs and integrating third-party libraries
        Knowledge of version control systems (e.g., Git)
        Mobile Development:
        Experience in building and deploying cross-platform mobile applications (iOS and Android)
        Understanding of platform-specific guidelines and best practices
        Web Development:
        Experience in developing responsive and adaptive web applications using Flutter
        Knowledge of web-specific widgets and libraries in Flutter
        Additional Skills (Nice-to-Have):
        Familiarity with other state management solutions (e.g., Provider, Riverpod, GetX)
        Experience with Firebase (e.g., Firestore, Authentication, Cloud Functions)
        Knowledge of CI/CD pipelines for Flutter apps
        Understanding of testing frameworks (e.g., unit testing, widget testing, integration testing)
        Basic knowledge of UI/UX principles and design tools (e.g., Figma, Adobe XD)''',
                        style: AppTextStyle.regular14(context).copyWith(
                          color: Theme.of(context).textTheme.bodySmall!.color,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
