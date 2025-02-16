import 'package:career/core/themes/styles/app_text_style.dart';
import 'package:career/core/widgets/screen_wrapper.dart';
import 'package:career/features/notification/presentation/ui/widgets/notification_item.dart';
import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      backgroundImage: DecorationImage(
        image: AssetImage(
          Assets.images.homeScreen.path,
        ),
        fit: BoxFit.cover,
      ),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Notifications",
          style: AppTextStyle.bold16(context),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemBuilder: (context, index) => const NotificationItem(
              notifyData:
                  'العطر ليس زجاجة في اليد، بل رسالة تكتبها دون أن تَشهد.',
            ),
          ),
        ],
      ),
    );
  }
}
