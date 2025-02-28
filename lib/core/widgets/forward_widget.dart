import 'package:flutter/material.dart';

class ForwardWidget extends StatelessWidget {
  const ForwardWidget({
    super.key,required this.onPressed,
  });
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: onPressed,
        // () {
        //   context.read<RegisterAsPersonCubit>().next();
        // },
        backgroundColor: Theme.of(context).textTheme.bodyMedium!.color,
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
      ),
    );
  }
}
