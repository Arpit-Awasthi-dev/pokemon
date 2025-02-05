import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return;
      },
      child: Container(
        color: Colors.black.withOpacity(0.2),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          color: AppColors.appColor,
        ),
      ),
    );
  }
}
