import 'dart:ui';

import 'package:career/core/widgets/primary_container.dart';
import 'package:career/features/main/presentation/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CareerBottomNavBar extends StatelessWidget {
  const CareerBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 4,
              sigmaY: 4,
            ),
            child: PrimaryContainer(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(0),
              color: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .color!
                  .withValues(alpha: 0.1),
              hight: 50.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<MainCubit>().changeIndex(0);
                    },
                    icon: Icon(
                      Icons.home,
                      color:
                          BlocProvider.of<MainCubit>(context).currentIndex == 0
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).textTheme.bodySmall!.color,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<MainCubit>().changeIndex(1);
                    },
                    icon: Icon(
                      Icons.person,
                      color: context.read<MainCubit>().currentIndex == 1
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).textTheme.bodySmall!.color,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<MainCubit>().changeIndex(2);
                    },
                    icon: Icon(
                      Icons.notifications,
                      color: context.read<MainCubit>().currentIndex == 2
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).textTheme.bodySmall!.color,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<MainCubit>().changeIndex(3);
                    },
                    icon: Icon(
                      Icons.settings,
                      color: context.read<MainCubit>().currentIndex == 3
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).textTheme.bodySmall!.color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
