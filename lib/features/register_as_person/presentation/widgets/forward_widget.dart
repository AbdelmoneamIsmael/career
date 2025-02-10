import 'package:career/features/register_as_person/presentation/cubit/register_as_person_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForwardWidget extends StatelessWidget {
  const ForwardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          context.read<RegisterAsPersonCubit>().next();
        },
        backgroundColor: Theme.of(context).textTheme.bodyMedium!.color,
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
      ),
    );
  }
}
