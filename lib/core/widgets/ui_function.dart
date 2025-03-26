import 'package:career/core/app_texts/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/date_picker.dart' as datepicker;
import 'package:motion_toast/motion_toast.dart';
import 'package:career/core/themes/styles/app_text_style.dart';

class UiHelper {
  static showSnakBar({
    required String message,
    required BuildContext context,
    required MotionToastType type,
  }) {
    switch (type) {
      case MotionToastType.success:
        MotionToast.success(
          position: MotionToastPosition.top,
          animationType: AnimationType.fromLeft,
          description: Text(
            message,
            style: AppTextStyle.medium16(context).copyWith(
              color: Colors.white,
            ),
          ),
        ).show(context);
        break;
      case MotionToastType.error:
        MotionToast.error(
          position: MotionToastPosition.top,
          animationType: AnimationType.fromLeft,
          description: Text(
            message,
            style: AppTextStyle.medium16(context).copyWith(
              color: Colors.white,
            ),
          ),
        ).show(context);
        break;
      case MotionToastType.warning:
        MotionToast.warning(
          position: MotionToastPosition.top,
          animationType: AnimationType.fromLeft,
          description: Text(
            message,
            style: AppTextStyle.medium16(context).copyWith(
              color: Colors.white,
            ),
          ),
        ).show(context);
        break;
      case MotionToastType.info:
        MotionToast.info(
          position: MotionToastPosition.top,
          animationType: AnimationType.fromLeft,
          description: Text(
            message,
            style: AppTextStyle.medium16(context).copyWith(
              color: Colors.white,
            ),
          ),
        ).show(context);
        break;
      case MotionToastType.custom:
        MotionToast.success(
          position: MotionToastPosition.top,
          animationType: AnimationType.fromLeft,
          description: Text(
            message,
            style: AppTextStyle.medium16(context).copyWith(
              color: Colors.white,
            ),
          ),
        ).show(context);
        break;
    }
  }

  static Future<DateTime?> showDatePicker({
    required BuildContext context,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
  }) async {
    var date = await datepicker.showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    return date;
  }

  static Future<bool> showDialog({
    required String message,
    required BuildContext context,
    required String title,
  }) async {
    final response = await showAdaptiveDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          title: Text(
            title,
            style: AppTextStyle.medium16(context),
          ),
          content: Text(
            message,
            style: AppTextStyle.regular14(context),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                AppLocalizations.of(context).cancel,
                style: AppTextStyle.medium14(context),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(
                AppLocalizations.of(context).ok,
                style: AppTextStyle.medium14(context),
              ),
            ),
          ],
        );
      },
    );
    return response ?? false;
  }
}
