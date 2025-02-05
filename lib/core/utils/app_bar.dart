import 'package:flutter/material.dart';
import 'package:pokemon/core/theme/app_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget> actions;

  const AppBarWidget({
    required this.title,
    this.actions = const [],
    super.key,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.appColor,
      title: title,
      actions: actions,
      titleSpacing: 0,
    );
  }

  @override
  final Size preferredSize; // default is 56.0
}
