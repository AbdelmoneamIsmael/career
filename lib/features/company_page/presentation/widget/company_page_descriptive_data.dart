import 'package:flutter/material.dart';

class CompanyPageDescriptiveData extends StatelessWidget {
  const CompanyPageDescriptiveData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'aramco',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          Text(
            'where energy is opportunity',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
