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
      firstDate:firstDate,
      lastDate: lastDate,
    );

    return date;
  }
}
