import 'package:career/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CompanyPageImageAndBackground extends StatelessWidget {
  const CompanyPageImageAndBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: Image.asset(
            Assets.images.companyBackground.path,
            width: double.infinity,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 50,
          left: 16,
          child: Container(
            padding: const EdgeInsets.all(3),
            color: Colors.white,
            child: Image.asset(
              Assets.images.companyImage.path,
              width: 70,
              height: 70,
            ),
          ),
        ),
      ],
    );
  }
}
