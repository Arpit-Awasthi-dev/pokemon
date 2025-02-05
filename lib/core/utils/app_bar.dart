import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/core/theme/app_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget> actions;

  const AppBarWidget({
    required this.title,
    this.leading,
    this.actions = const [],
    super.key,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.appColor,
      title: _title(context),
      leading: leading,
      actions: actions,
      titleSpacing: 0,
    );
  }

  Widget _title(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        title,
        style: context.textTheme.titleLarge!.copyWith(
          color: Colors.black,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  @override
  final Size preferredSize; // default is 56.0
}
