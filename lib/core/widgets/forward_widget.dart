import 'package:career/core/bloc/app_bloc.dart';
import 'package:career/core/model/app_model/app_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForwardWidget extends StatelessWidget {
  const ForwardWidget({
    super.key,
    required this.onPressed,
  });
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: onPressed,
        backgroundColor: Theme.of(context).textTheme.bodyMedium!.color,
        child: Transform.rotate(
          angle: context.read<AppBloc>().appModel.language ==
                  ApplicationLanguage.en
              ? 0
              : 3.14,
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
      ),
    );
  }
}
